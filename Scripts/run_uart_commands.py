import time
import serial
import sys
import datetime

NUM_REQUIRED_ARGS = 6
if len(sys.argv) != 1 + NUM_REQUIRED_ARGS:
    print("Provide arguments: UART_DEVICE, BAUD_RATE, ELF_NAME, OUTPUT_LOG")
    sys.exit(1)
    
UART_DEVICE, BAUD_RATE, REMOTE_DIR, ELF_NAME, FILE_SIZE, OUTPUT_LOG = sys.argv[1:]

print("Opening UART connection...")
with serial.Serial(UART_DEVICE, BAUD_RATE, timeout=1) as ser:
    time.sleep(1)  # Wait for UART to stabilize
    print("Sending commands to UART...")
    
    cmd = f"{REMOTE_DIR}/{ELF_NAME}\n"
    ser.write(cmd.encode('utf-8'))
    time.sleep(5)  # Wait for command to be processed
    
    # ic benchmark takes longer
    if "ic" in ELF_NAME or "vww" in ELF_NAME:
        time.sleep(15)
    
    print("Commands sent. Reading response...")
    with open(OUTPUT_LOG, "a") as log_file:
        current_time = datetime.datetime.now()
        formatted_time = current_time.strftime("%Y-%m-%d %H:%M:%S")
        log_file.write(f"[{formatted_time}] ####################################################\n")

        while True:
            line = ser.readline().decode('utf-8')
            if not line:
                log_file.write("\n")
                break
            log_file.write(line)
            print(line, end='')
            
        file_size_str = f"Code size: {FILE_SIZE}\n\n"
        log_file.write(file_size_str)
        print()
        print(file_size_str, end="")

print(f"UART commands executed. Output saved in {OUTPUT_LOG}.")
