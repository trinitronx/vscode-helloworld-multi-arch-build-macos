add_test (NAME inputOutputTest WORKING_DIRECTORY ${helloworld_BINARY_DIR} COMMAND sh -c "./helloworld < ${helloworld_SOURCE_DIR}/test/fixtures/inputOutputTest.txt")

set (inputOutputPassPromptRegex "^Enter a value: " "^You entered: abcd:12:34:99999999999999.000000$" "^Items read: 4$")
set (inputOutputFailRegex "Error" "Fail" "^Abort trap: \\d+")
set_tests_properties (inputOutputTest PROPERTIES
              PASS_REGULAR_EXPRESSION "${inputOutputPassPromptRegex}"
              FAIL_REGULAR_EXPRESSION "${inputOutputFailRegex}"
              REQUIRED_FILES ${helloworld_SOURCE_DIR}/test/fixtures/inputOutputTest.txt)

add_test (NAME largeInputTest WORKING_DIRECTORY ${helloworld_BINARY_DIR} COMMAND sh -c "./helloworld < ${helloworld_SOURCE_DIR}/test/fixtures/largeInputTest.txt")
set (largeInputPassPromptRegex "^Enter a value: " "You entered: abcdefghijklmnopqrstuvwxyz01234567890abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789000:12:34:99999999999999.000000" "^Items read: 4$")
set (largeInputFailRegex "Error" "Fail" "^Abort trap: \\d+" "^You entered: abcdefghijklmnopqrstuvwxyz01234567890abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz:123456789:0:.*$" "^Items read: 2$")
set_tests_properties (largeInputTest PROPERTIES
              PASS_REGULAR_EXPRESSION "${largeInputPassPromptRegex}"
              REQUIRED_FILES ${helloworld_SOURCE_DIR}/test/fixtures/largeInputTest.txt
              FAIL_REGULAR_EXPRESSION "${largeInputFailRegex}")
