add_executable(vww)

target_include_directories(vww
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(vww
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_input_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_input_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_model_data.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_model_data.h
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_model_settings.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_model_settings.h
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_output_data_ref.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/vww_data/vww_output_data_ref.h
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

target_link_libraries(vww
  ${CMAKE_PROJECT_NAME}
)
