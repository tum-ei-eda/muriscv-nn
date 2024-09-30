#! /usr/bin/env python3

import os
from git import Repo
import datetime


cmsis_filename_prefixes = ["arm_nn_", "arm_nn", "arm_"]

cmsis_varnames = ["arm_cmsis_nn_", "arm_nn_", "arm_nn", "arm_", "cmsis_nn_"]
cmsis_errornames = ["ARM_CMSIS_NN_"]

# Translations between cmsis comments/headers to muriscv
cmsis_commentnames = ["cmsis-nn", "CMSIS NN", "_ARM_NN", "ARM_NN_", "ARM_NN"]
muriscv_commentnames = ["muriscv-nn", "MURISCV NN", "_MURISCV_NN_", "MURISCV_NN_", "MURISCV_NN"]

cmsis_include_files = ["arm_nnfunctions.h", "arm_nntypes.h", "arm_nnsupportfunctions.h", "arm_nn_math_types.h"]
muriscv_include_files = [
    "muriscv_nn_functions.h",
    "muriscv_nn_types.h",
    "muriscv_nn_support_functions.h",
    "muriscv_nn_math_types.h",
]

cur_year = datetime.date.today().year
TUM_Copyright = " Modifications copyright (C) " + str(cur_year) + " Chair of Electronic Design Automation, TUM\n"

scripts_dir = os.getcwd()
muriscv_dir = scripts_dir + "/.."
cmsis_dir = scripts_dir + "/CMSIS_NN"

muriscv_include_dir = muriscv_dir + "/Include"
cmsis_include_dir = cmsis_dir + "/Include"


new_test_CMakeList = [
    "#\n",
    "# Copyright (C) " + str(cur_year) + " Chair of Electronic Design Automation, TUM.\n",
    "#\n",
    "# SPDX-License-Identifier: Apache-2.0\n",
    "#\n",
    "# Licensed under the Apache License, Version 2.0 (the License); you may\n",
    "# not use this file except in compliance with the License.\n",
    "# You may obtain a copy of the License at\n",
    "#\n",
    "# www.apache.org/licenses/LICENSE-2.0\n",
    "#\n",
    "# Unless required by applicable law or agreed to in writing, software\n",
    "# distributed under the License is distributed on an AS IS BASIS, WITHOUT\n",
    "# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n",
    "# See the License for the specific language governing permissions and\n",
    "# limitations under the License.\n",
    "#\n",
    "\n",
]


mismatch_list = []


# Function to create a new file from the CMSIS template
def create_muriscv_nn_file(muriscv_filename, muriscv_path, cmsis_filename, cmsis_path):
    cmsis_file = open(cmsis_path + "/" + cmsis_filename, "r")
    muriscv_file = open(muriscv_path + "/" + muriscv_filename, "w")
    muriscv_file.writelines("//" + TUM_Copyright)
    arm_code_block = False
    for line in cmsis_file:
        newline = line.replace("arm_nnfunctions.h", "muriscv_nn_functions.h")
        newline = newline.replace("arm_nnsupportfunctions.h", "muriscv_nn_support_functions.h")
        newline = newline.replace("../TestData", "../../TestData")
        newline = newline.replace("../Utils", "../../Utils")

        # check if line is beginning or end of optimized arm code block
        if "#if defined" in line or "#ifdef" in line or ("#else" in line and not arm_code_block):
            arm_code_block = True
        elif "#else" in line or "#endif" in line:
            arm_code_block = False
            newline = "//" + newline
        elif "#if !defined(" in line:
            newline = "//" + newline

        # if line is in optimized arm code block, comment out
        if arm_code_block:
            newline = "//" + newline
        newline = newline.replace("ARM_MATH_MVEI", "USE_VEXT")
        newline = newline.replace("ARM_MATH_DSP", "USE_PEXT")

        for var_name in cmsis_varnames:
            newline = newline.replace(var_name, "muriscv_nn_")
        for error_name in cmsis_errornames:
            newline = newline.replace(error_name, "MURISCV_NN_")
        muriscv_file.writelines(newline)
    cmsis_file.close()
    muriscv_file.close()


# Function to add a list of new files to the CMakeLists.txt file for a given directory
def add_to_cmakelist(muriscv_filenames, muriscv_path):
    cmakelist = open(muriscv_path + "/" + "CMakeLists.txt", "r+")
    new_cmakelist = []
    for line in cmakelist:
        # end of file has been reached
        if "Modifications copyright (C)" in line:
            new_cmakelist.append("#" + TUM_Copyright)
        elif ".c)" in line:
            newline = line.replace(")", "")
            new_cmakelist.append(newline)
            newfiles = []
            for file in muriscv_filenames:
                if file != "CMakeLists.txt":
                    newfiles.append(file)
            for i in range(len(newfiles) - 1):
                new_cmakelist.append(
                    "                                        ${CMAKE_CURRENT_SOURCE_DIR}/" + newfiles[i] + "\n"
                )
            new_cmakelist.append(
                "                                        ${CMAKE_CURRENT_SOURCE_DIR}/" + newfiles[-1] + ")\n"
            )

        else:
            new_cmakelist.append(line)

    cmakelist.seek(0)
    cmakelist.truncate()
    for line in new_cmakelist:
        cmakelist.writelines(line)

    cmakelist.close()


# Function to get all function blocks in a given file/code snippet.  File should be provided as a dictionary
# Returns dictonary of all function blocks found, with elements of the form:
# ["function name", "line number", [Dict of lines in function block], custom code flag]
def get_function_blocks(file):
    functions = []
    ptr_file = 0
    custom = False
    custom_code_line = "//MURISCV_NN CUSTOM CODE\n"
    while ptr_file < len(file):
        # upcoming function contains a custom implementation
        if "MURISCV_NN CUSTOM CODE" in file[ptr_file]:
            print("CUSTOM LINE FOUND ON LINE " + str(ptr_file + 1))
            custom = True

        # Beginning of a block of new code, with no match in cmsis
        if "MURISCV_NN NEW CODE" in file[ptr_file]:
            func_block = []
            func_block_ptr = ptr_file
            while not ("MURISCV_NN END OF NEW CODE" in file[ptr_file]):
                func_block.append(file[ptr_file])
                ptr_file += 1
            func_block.append(file[ptr_file])
            functions.append(["MURISCV_NN NEW CODE", func_block_ptr, func_block, custom])

        # beginning of a block comment before function declaration
        # This function block ends with ); or '\n' if #define statement
        elif "/**" in file[ptr_file] and "@brief" in file[(ptr_file + 1) % len(file)]:
            func_block = []
            func_block_ptr = ptr_file
            # if custom function, add comment and move starting pointer
            if custom:
                func_block.append(custom_code_line)
                func_block_ptr -= 1

            while not ("*/" in file[ptr_file]):
                func_block.append(file[ptr_file])
                ptr_file += 1
            func_block.append(file[ptr_file])
            ptr_file += 1
            name = file[ptr_file].replace("(", " ")
            name = name.replace("*", "")
            name = name.split(" ")
            # handle blank space between comment and function header
            while len(name) < 2:
                func_block.append(file[ptr_file])
                ptr_file += 1
                name = file[ptr_file].replace("(", " ")
                name = name.replace("*", " ")
                name = name.split(" ")
            func_name = []
            if name[0] == "__STATIC_FORCEINLINE":
                if name[1] == "const":
                    func_name = name[3]
                else:
                    func_name = name[2]
            else:
                func_name = name[1]

            # Find the end of the function declaration ( a ')' in the line).
            # This handles functions with arguments across multiple lines
            while not (")" in file[ptr_file]):
                func_block.append(file[ptr_file])
                ptr_file += 1

            # Find end of this function block
            if file[(ptr_file + 1) % len(file)] == "{\n":  # This handles functions with contents in {}
                while not ("}\n" == file[ptr_file] or "};\n" == file[ptr_file]):
                    func_block.append(file[ptr_file])
                    ptr_file += 1
            else:  # This handles functions defined in a single line
                while not (");" in file[ptr_file] or file[ptr_file] == "\n"):
                    func_block.append(file[ptr_file])
                    ptr_file += 1

            func_block.append(file[ptr_file])  # Add termination line
            functions.append([func_name, func_block_ptr, func_block, custom])
            custom = False

        # beginning of a function block written as a #define statement.
        # This function block ends with an empty line or another #define
        elif "#define" in file[ptr_file]:
            func_block = []
            func_block_ptr = ptr_file
            while not (
                ("#define" in file[ptr_file] and ptr_file != func_block_ptr)
                or file[ptr_file] == "\n"
                or "MURISCV_NN CUSTOM CODE" in file[ptr_file]
            ):
                func_block.append(file[ptr_file])
                ptr_file += 1

            # Add the custom code comment line if needed
            if custom:
                func_block.insert(0, custom_code_line)
                func_block_ptr -= 1
            # Find name of block
            name = []
            for line in func_block:
                if "#define" in line:
                    name = line.replace("(", " ")
                    name = name.split(" ")
            functions.append([name[1], func_block_ptr, func_block, custom])
            custom = False

        # Function with no comment header.  Terminates with } at index 0  in line
        elif "__STATIC_FORCEINLINE" in file[ptr_file]:
            func_block = []
            func_block_ptr = ptr_file
            while not ((file[ptr_file][0] == "}")):
                func_block.append(file[ptr_file])
                ptr_file += 1

            name = func_block[0].replace("(", " ")
            name = name.split(" ")[2]
            # Add the custom code comment line if needed
            if custom:
                func_block.insert(0, custom_code_line)
                func_block_ptr -= 1

            functions.append([name, func_block_ptr, func_block, custom])
            custom = False

        else:
            # no function block on line
            ptr_file += 1

    return functions


def update_include_file(muriscv_filename, muriscv_path, cmsis_filename, cmsis_path):
    muriscv_file = open(muriscv_path + "/" + muriscv_filename, "r+")
    cmsis_file = open(cmsis_path + "/" + cmsis_filename, "r")
    cmsis_file_output = open(cmsis_path + "/" + "out.h", "w")
    muriscv_file_old = []
    muriscv_file_new = []
    cmsis_file_original = []
    cmsis_file_updated = []

    for line in cmsis_file:
        cmsis_file_original.append(line)
        newline = line.replace("arm_nnfunctions.h", "muriscv_nn_functions.h")
        newline = newline.replace("arm_nnsupportfunctions.h", "muriscv_nn_support_functions.h")
        newline = newline.replace("supportfunctions", "support_functions")
        newline = newline.replace("SUPPORTFUNCTIONS", "SUPPORT_FUNCTIONS")
        newline = newline.replace("ARM_MATH_MVEI", "USE_VEXT")
        newline = newline.replace("ARM_MATH_DSP", "USE_PEXT")
        newline = newline.replace("ARM_MATH_DSP", "USE_PEXT")
        newline = newline.replace("CMSIS_NN_USE_SINGLE_ROUNDING", "MURISCV_NN_USE_SINGLE_ROUNDING")
        for var_name in cmsis_varnames:
            newline = newline.replace(var_name, "muriscv_nn_")
        for error_name in cmsis_errornames:
            newline = newline.replace(error_name, "MURISCV_NN_")
        for i in range(len(cmsis_commentnames)):
            newline = newline.replace(cmsis_commentnames[i], muriscv_commentnames[i])
        cmsis_file_updated.append(newline)
    for line in muriscv_file:
        muriscv_file_old.append(line)

    # debug Reference file
    for line in cmsis_file_updated:
        cmsis_file_output.writelines(line)
    cmsis_file_output.close()

    cmsis_functions = get_function_blocks(cmsis_file_updated)
    muriscv_functions = get_function_blocks(muriscv_file_old)

    new_func_add = []
    old_func_remove = []

    # find functions to add and remove

    for function_cmsis in cmsis_functions:
        need_to_add = True
        for function_muriscv in muriscv_functions:
            if function_cmsis[0] == function_muriscv[0]:
                need_to_add = False
        if need_to_add:
            new_func_add.append(function_cmsis)

    for function_muriscv in muriscv_functions:
        need_to_remove = True
        for function_cmsis in cmsis_functions:
            if function_cmsis[0] == function_muriscv[0] or function_muriscv[0] == "MURISCV_NN NEW CODE":
                need_to_remove = False
        if need_to_remove:
            old_func_remove.append(function_muriscv)

    print("CMSIS Functions")
    for name in cmsis_functions:
        print("NAME: " + name[0] + " LINE NUMBER: " + str(name[1] + 1))
    print("")
    print("MURISCV Functions")
    for name in muriscv_functions:
        print("NAME: " + name[0] + " LINE NUMBER: " + str(name[1] + 1))
    print("")
    print("NEW FUNCTIONS TO BE ADDED")
    for name in new_func_add:
        print(name[0])
    print("")
    print("OLD FUNCTIONS TO BE REMOVED")
    for name in old_func_remove:
        print(name[0] + "LINE : " + str(name[1]) + " MURISCV")
    print("")

    # get a list of the operations that need to be done to create the final file
    # will be of the structure ["op", function name, CMSIS BLOCK, MURISCV BLOCK]
    new_file_ops = []
    for block in cmsis_functions:
        if block in new_func_add:
            new_file_ops.append(["ADD", block[0], block, []])
        else:
            new_file_ops.append(["COMPARE", block[0], block, []])

    # add necessary muriscv blocks to existing operations
    for op in new_file_ops:
        for block in muriscv_functions:
            if block[0] == op[1]:
                op[3] = block

    # insert New Code and Remove Code ops to op list by comparing line numbers
    for block in muriscv_functions:
        if block in old_func_remove:
            i = 0
            # search for block where line number is greater than the block to be removed.
            # Identify where to place new block in order
            while i < len(new_file_ops):
                if new_file_ops[i][0] != "ADD":
                    if block[1] < new_file_ops[i][3][1]:
                        break
                i += 1
            new_file_ops.insert(i, ["REMOVE", block[0], [], block])

        elif block[0] == "MURISCV_NN NEW CODE":
            i = 0
            # search for block where line number is greater than the block to be removed.
            # Identify where to place new block in order
            while i < len(new_file_ops):
                if new_file_ops[i][0] != "ADD":
                    if block[1] < new_file_ops[i][3][1]:
                        break
                i += 1
            new_file_ops.insert(i, ["NEW CODE", block[0], [], block])

        # Calculate length to the next sync point.  This determines if new lines have been added.
        # If they get added mention it.  Dont do line by line comparison in this case, not useful.
        # If length to next sync point is the same, operate line by line and check for changes.
        # Do operations when you reach the proper pointers at sync point, compare functions repeat.

    muriscv_file_new.append(muriscv_file_old[0])

    ptr_muriscv = 1  # start past modified copyright line
    ptr_cmsis = 0
    file_changed = False
    while ptr_muriscv < len(muriscv_file_old) or ptr_cmsis < len(cmsis_file_updated):
        # Find the next "Sync Point".  This is where both files should match.
        # This is either the beginning of a function declaration present in both files or the end of the file.
        # All operations up to/including the sync point will be performed in this iteration of the loop
        next_ops = new_file_ops
        sync_ptr_muriscv = len(muriscv_file_old)
        sync_ptr_cmsis = len(cmsis_file_updated)
        # See if an earlier sync point exists
        for i in range(
            len(new_file_ops) - 1, -1, -1
        ):  # count backwards from end of list to 0 to find the earliest sync point
            if new_file_ops[i][0] == "COMPARE":
                # earlier sync point found
                next_ops = new_file_ops[0 : i + 1]

                sync_ptr_muriscv = new_file_ops[i][3][1]
                sync_ptr_cmsis = new_file_ops[i][2][1]

        # Calculate number of lines outside of function blocks to see if any have been added or removed
        len_muriscv = sync_ptr_muriscv - ptr_muriscv
        len_cmsis = sync_ptr_cmsis - ptr_cmsis

        # Remove operations we are about to perform from the remaining list and calculate length
        # of code outside of blocks
        for op in next_ops:
            new_file_ops.remove(op)
            if op[0] == "ADD":
                # add op means extra lines present in len_cmsis.  remove them from count
                len_cmsis -= len(op[2][2])
            elif op[0] == "NEW CODE":
                # New code op means extra lines present in len_muriscv.  remove them from count
                len_muriscv -= len(op[3][2])
            elif op[0] == "REMOVE":
                # Remove op means extra lines present in len_muriscv.  remove them from count
                len_muriscv -= len(op[3][2])

        # If there is a mismatch, mark that the file has been changed (for writing the copyright)
        lines_added = len_cmsis - len_muriscv
        if lines_added != 0:
            print("#####Lines Added in current section : " + str(len_cmsis - len_muriscv))
            file_changed = True

        # Go line by line and compare, up to the next sync point
        # Perform any operations when the correct line is reached
        while ptr_muriscv < sync_ptr_muriscv or ptr_cmsis < sync_ptr_cmsis:

            block_processed = False

            for op in next_ops:
                if op[0] == "NEW CODE":
                    # For new code OP, check if correct line number for muRISCV has been reached
                    # If so, insert new code
                    if ptr_muriscv == op[3][1]:
                        print(
                            "######OPERATION: MURISCV NEW CODE BLOCK LINE NUMBER "
                            + str(op[3][1] + 1)
                            + " IN MURISCV ADDED TO OUTPUT FILE######"
                        )
                        print(op[3][2])
                        for line in op[3][2]:
                            muriscv_file_new.append(line)
                            ptr_muriscv += 1
                        next_ops.remove(op)
                        block_processed = True
                elif op[0] == "ADD":
                    # For ADD OP, check if correct line number for cmsis has been reached
                    # If so, insert new code
                    if ptr_cmsis == op[2][1]:
                        print(
                            "######OPERATION: FUNCTION BLOCK "
                            + op[1]
                            + " LINE NUMBER "
                            + str(op[2][1] + 1)
                            + " IN CMSIS ADDED TO OUTPUT FILE######"
                        )
                        for line in op[2][2]:
                            muriscv_file_new.append(line)
                            ptr_cmsis += 1
                        next_ops.remove(op)
                        file_changed = True
                        block_processed = True

                elif op[0] == "REMOVE":
                    # For Remove OP, check if correct line number for muriscv has been reached
                    # If so, increment pointer over code to be removed
                    if ptr_muriscv == op[3][1]:
                        print(
                            "######OPERATION: FUNCTION BLOCK "
                            + op[1]
                            + " LINE NUMBER "
                            + str(op[3][1] + 1)
                            + " IN MURISCV REMOVED FROM OUTPUT FILE######"
                        )
                        for line in op[3][2]:
                            ptr_muriscv += 1
                        next_ops.remove(op)
                        block_processed = True

            if not (block_processed):
                # current location is a line outside the code block
                if lines_added == 0:
                    # no lines have been added.  Do a line by line comparison to see if anything has changed
                    if muriscv_file_old[ptr_muriscv] != cmsis_file_updated[ptr_cmsis]:
                        print(
                            "######DIFFERENCE DETECTED: MURISCV LINE "
                            + str(ptr_muriscv + 1)
                            + "| CMSIS LINE "
                            + str(ptr_cmsis + 1)
                            + " ######"
                        )
                        file_changed = True
                # Write the most updated line from cmsis to the new file and advance both pointers.
                # Unless final sync point has been reached, which is the end of the file

                # If sync pointer was reached by adding a block, dont append
                if ptr_cmsis != sync_ptr_cmsis:
                    muriscv_file_new.append(cmsis_file_updated[ptr_cmsis])

                if ptr_cmsis >= sync_ptr_cmsis:
                    # sync point has been passed, skip muriscv pointer and reset
                    ptr_cmsis = sync_ptr_cmsis
                else:
                    ptr_cmsis += 1

                if ptr_muriscv >= sync_ptr_muriscv:
                    ptr_muriscv = sync_ptr_muriscv
                else:
                    ptr_muriscv += 1

        # At the sync pointEither a COMPARE op or EOF.  EOF do nothing, main loop exits
        if len(next_ops) == 1:
            # final operation is a comapre op.  Perform it
            print(muriscv_file_new[-1])
            print(
                "######OPERATION: COMPARE FUNCTION BLOCK "
                + next_ops[0][1]
                + " MURISCV LINE "
                + str(ptr_muriscv + 1)
                + "| CMSIS LINE "
                + str(ptr_cmsis + 1)
                + " ######"
            )

            # Check if function block is a custom implementation.  If so, skip comparison and write muriscv version.
            if next_ops[0][3][3]:
                print("#####CUSTOM FUNCTION BLOCK FOUND IN MURISCV_NN#####")
                # Custom implementation.  Write muriscv version and advance pointers
                for line in next_ops[0][3][2]:
                    muriscv_file_new.append(line)
                    print(line)
                ptr_muriscv += len(next_ops[0][3][2])
                ptr_cmsis += len(next_ops[0][2][2])
            else:
                # non-custom function block.  Check lengths and attempt to compare line by line
                if len(next_ops[0][3][2]) != len(next_ops[0][2][2]):
                    print("#####LINES ADDED OR REMOVED FROM FUNCTION BLOCK#####")
                    file_changed = True
                else:
                    for i in range(0, len(next_ops[0][3][2])):
                        if next_ops[0][3][2][i] != next_ops[0][2][2][i]:
                            print(
                                "######DIFFERENCE DETECTED: MURISCV LINE "
                                + str(ptr_muriscv + 1 + i)
                                + "| CMSIS LINE "
                                + str(ptr_cmsis + 1 + i)
                                + " ######"
                            )
                            file_changed = True
                # write the cmsis version to the new file
                for line in next_ops[0][2][2]:

                    muriscv_file_new.append(line)
                ptr_muriscv += len(next_ops[0][3][2])
                ptr_cmsis += len(next_ops[0][2][2])

    if file_changed:
        muriscv_file_new[0] = "//" + TUM_Copyright

    muriscv_file.seek(0)
    muriscv_file.truncate()
    for line in muriscv_file_new:
        muriscv_file.writelines(line)

    muriscv_file.close()
    cmsis_file.close()

    # update the defines file if updating the main muriscv_nn_functions file
    # build the list of define statements to write
    if muriscv_filename == "muriscv_nn_functions.h":
        cmsis_functions_original = get_function_blocks(cmsis_file_original)
        defines_file = open(muriscv_path + "/CMSIS/NN/Include/arm_nnfunctions.h", "r+")
        defines_contents = []
        for line in defines_file:
            defines_contents.append(line)
        define_statements = []
        define_base = "#define"
        for i in range(len(cmsis_functions)):
            define_statements.append(
                define_base + " " + cmsis_functions_original[i][0] + " " + cmsis_functions[i][0] + "\n"
            )

        defines_file.seek(0)
        defines_file.truncate()

        for i in range(len(defines_contents)):
            line = defines_contents[i]
            defines_file.writelines(line)
            if "#endif" in line:
                for newDefine in define_statements:
                    defines_file.writelines(newDefine)
                defines_file.writelines("#ifdef __cplusplus\n")
                defines_file.writelines("}\n")
                defines_file.writelines("#endif\n")
                defines_file.writelines("#endif /* _ARM_NNFUNCTIONS_H */\n")
                break

        defines_file.close()


#########################
# Main Entry Point: #####
#########################

if not os.path.isdir(cmsis_dir):
    Repo.clone_from("https://github.com/ARM-software/CMSIS-NN.git", cmsis_dir)

# This block copies over any new source files
subdir_cmsis_gen = os.walk(cmsis_dir + "/Source/")
# loop over every directory in CMSIS Source and Compare to MURISCV-NN
for subdir_cmsis in subdir_cmsis_gen:

    # get matching subdirectory in MURISCV-NN
    cur_dir_MURISCV = subdir_cmsis[0].replace(cmsis_dir, muriscv_dir)
    # Confirm if directory exists.  If not, create it
    if not os.path.isdir(cur_dir_MURISCV):
        os.mkdir(cur_dir_MURISCV)
        mismatch_list.append(cur_dir_MURISCV)

    # get current files and directories in current muRISCV-nn directory
    subdir_muriscv = next(os.walk(cur_dir_MURISCV))

    # check all files in the current subdirectory
    new_files_this_subdirectory = []
    for file_cmsis in subdir_cmsis[2]:
        present = False
        file_cmsis_updated = file_cmsis
        # adjust file name to match muriscv-nn conventions.
        for prefix in cmsis_filename_prefixes:
            file_cmsis_updated = file_cmsis_updated.replace(prefix, "muriscv_nn_")

        for file_muriscv in subdir_muriscv[2]:
            if file_cmsis_updated == file_muriscv:
                present = True
        if not present:
            mismatch_list.append(subdir_muriscv[0] + file_cmsis_updated)
            new_files_this_subdirectory.append(file_cmsis_updated)
            create_muriscv_nn_file(file_cmsis_updated, subdir_muriscv[0], file_cmsis, subdir_cmsis[0])

    if len(new_files_this_subdirectory) > 0:
        # print("adding these files to cmakelists " + new_files_this_subdirectory)
        add_to_cmakelist(new_files_this_subdirectory, subdir_muriscv[0])


# This block copies over any new Test folders and corresponding data
# Code works, for copying over tests and adding them correctly, but arm has updated its test framework.
# TODO: UPDATE ALL TESTS TO THIS NEW FRAMEWORK
# new_tests = []
# subdir_cmsis = next(os.walk(cmsis_dir + '/Tests/UnitTest/TestCases/'))
# subdir_muriscv = next(os.walk(muriscv_dir + '/Tests/TestCases'))
# for test_dir in subdir_cmsis[1]:
#    #skip the CMSIS specific folders in this directory
#    if not("Utils" in test_dir or "TestData" in test_dir):
#        #check for matching subdirectory in muriscv
#        present = False
#        new_name = test_dir
#        for prefix in cmsis_filename_prefixes:
#            new_name = new_name.replace(prefix, "muriscv_nn_")
#        for muriscv_test in subdir_muriscv[1]:
#            if muriscv_test == new_name:
#                present = True
#        if present == False:
#            #Test is missing from muriscv_nn.  Need to add it
#            os.mkdir(muriscv_dir + '/Tests/TestCases/' + new_name)
#            new_tests.append(new_name)
#            #create new cmakelist file
#            cmakelist = open(muriscv_dir + '/Tests/TestCases/' + new_name + '/CMakeLists.txt', "w")
#            for line in new_test_CMakeList:
#                cmakelist.writelines(line)
#            cmakelist.writelines("add_muriscv_nn_unit_test(" + new_name + ")\n")
#            cmakelist.close()
#            #need to copy over new test source and update names
#            create_muriscv_nn_file(new_name+".c", muriscv_dir + '/Tests/TestCases/' + new_name, test_dir + ".c", cmsis_dir + '/Tests/UnitTest/TestCases/' + test_dir)
#
# #add new tests to cmakelists directory
# if len(new_tests) > 0:
#    cmakelist = open(muriscv_dir + '/Tests/TestCases/CMakeLists.txt', "r+")
#    file = []
#    for line in cmakelist:
#        file.append(line)
#    cmakelist.seek(0)
#    cmakelist.truncate()
#    for line in file:
#        cmakelist.writelines(line)
#    for test_name in new_tests:
#        cmakelist.writelines("add_subdirectory("+test_name + ")\n")
#    cmakelist.close()
#
# #copy new test data
# subdir_cmsis = next(os.walk(cmsis_dir + '/Tests/UnitTest/TestCases/TestData'))
# subdir_muriscv = next(os.walk(muriscv_dir + '/Tests/TestData'))
# for data_dir in subdir_cmsis[1]:
#    #check for matching subdirectory in muriscv
#    present = False
#    for muriscv_data in subdir_muriscv[1]:
#        if muriscv_data == data_dir:
#            present = True
#    if present == False:
#        print("NEW TEST DATA FOLDER " + data_dir)
#        #Test data is missing from muriscv_nn.  Need to add all files in the directory
#        os.mkdir(muriscv_dir + '/Tests/TestData/' + data_dir)
#        print("new test directory: " + cmsis_dir + '/Tests/UnitTest/TestCases/TestData/' + data_dir)
#        #need to copy over new test sources and update names
#        new_test_files = next(os.walk(cmsis_dir + '/Tests/UnitTest/TestCases/TestData/' + data_dir))
#        for file in new_test_files[2]:
#            create_muriscv_nn_file(file, muriscv_dir + '/Tests/TestData/' + data_dir +"/" , file, cmsis_dir + '/Tests/UnitTest/TestCases/TestData/' + data_dir)

# update the functions file
update_include_file("muriscv_nn_functions.h", muriscv_include_dir, "arm_nnfunctions.h", cmsis_include_dir)

# update the support functions file
update_include_file(
    "muriscv_nn_support_functions.h", muriscv_include_dir, "arm_nnsupportfunctions.h", cmsis_include_dir
)
