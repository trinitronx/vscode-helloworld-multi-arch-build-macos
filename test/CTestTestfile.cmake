add_test (NAME inputOutputTest WORKING_DIRECTORY ${helloworld_BINARY_DIR} COMMAND sh -c "./helloworld < ${helloworld_SOURCE_DIR}/test/fixtures/inputOutputTest.txt")

set (inputOutputPassPromptRegex "^Enter a value: " "^You entered: abcd:12:34:99999999999999.000000$" "^Items read: 4$")
set (inputOutputFailRegex "Error" "Fail" "^Abort trap: \\d+")
set_property (TEST inputOutputTest
              PROPERTY PASS_REGULAR_EXPRESSION "${inputOutputPassPromptRegex}")
set_property (TEST inputOutputTest
              PROPERTY FAIL_REGULAR_EXPRESSION "${inputOutputFailRegex}")

add_test (NAME largeInputTest WORKING_DIRECTORY ${helloworld_BINARY_DIR} COMMAND sh -c "./helloworld < ${helloworld_SOURCE_DIR}/test/fixtures/largeInputTest.txt")
set (largeInputPassPromptRegex "^Enter a value: " "^You entered: abcdefghijklmnopqrstuvwxyz01234567890abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789000:12:34:99999999999999.000000$" "^Items read: 4$")
set (largeInputFailRegex "Error" "Fail" "^Abort trap: \\d+")
set_property (TEST largeInputTest
              PROPERTY PASS_REGULAR_EXPRESSION "${largeInputPassPromptRegex}")
set_property (TEST largeInputTest
              PROPERTY FAIL_REGULAR_EXPRESSION "${largeInputFailRegex}")
