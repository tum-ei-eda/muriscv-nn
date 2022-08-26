add_executable(ic)

target_include_directories(ic
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(ic
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_input_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_input_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_model_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_model_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_model_settings.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_model_settings.h
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_output_data_ref.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/ic_data/ic_output_data_ref.h
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

target_link_libraries(ic
  ${CMAKE_PROJECT_NAME}
)
