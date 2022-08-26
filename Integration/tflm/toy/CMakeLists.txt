add_executable(toy)

target_include_directories(toy
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(toy
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_input_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_input_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_model_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_model_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_model_settings.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_model_settings.h
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_output_data_ref.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/toy_data/toy_output_data_ref.h
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

target_link_libraries(toy
  ${CMAKE_PROJECT_NAME}
)
