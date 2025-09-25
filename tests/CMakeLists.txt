cmake_minimum_required(VERSION 3.20)

# Ищем установленный GoogleTest
find_package(GTest REQUIRED)

# Исполняемый файл с тестами
add_executable(matrix_tests test_matrix.cpp)

# Заголовки проекта
target_include_directories(matrix_tests PRIVATE ${CMAKE_SOURCE_DIR}/include)

# Линкуем с GTest и нашей библиотекой
target_link_libraries(matrix_tests PRIVATE GTest::GTest GTest::Main matrix_lib)

# Регистрируем тест
add_test(NAME matrix_tests COMMAND matrix_tests)
