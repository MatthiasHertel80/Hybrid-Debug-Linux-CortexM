# groups.cmake

# group App
add_library(Group_App OBJECT
  "${SOLUTION_ROOT}/blinky/main.c"
)
target_include_directories(Group_App PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_App PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_App_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_App_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_App PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_App PUBLIC
  Group_App_ABSTRACTIONS
)

# group Board
add_library(Group_Board OBJECT
  "${SOLUTION_ROOT}/libs/board/devkit_gen2/board_init.c"
  "${SOLUTION_ROOT}/libs/board/appkit_gen2/board_init.c"
)
target_include_directories(Group_Board PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Board PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Board_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Board_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Board PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Board PUBLIC
  Group_Board_ABSTRACTIONS
)
