*** Settings ***
Library    SeleniumLibrary

*** Variables ***
@{num1}    1    2    3
@{num2}    หนึ่ง    สอง    สาม
@{num3}    one    two    three

*** Test Cases ***

# simple
#     FOR  ${i}  IN    one    two    three
#         Log To Console    ${i}
#     END

# simple list
#     @{list}    Create List    1    2    3    4
#     FOR  ${i}  IN    @{list}
#         Log To Console    ${i}
    
#     END

# three loop variables
#     FOR  ${a}    ${b}    ${c}  IN
#     ...  1        one      หนึ่ง
#     ...  2        teo      สอง
#     ...  3        three    สาม
#          Log To Console    ${a} ${b} ${c}
    
#     END

# loop variables list
#     @{list}    Create List    1        one      หนึ่ง    2        teo      สอง    3        three    สาม
#     FOR  ${a}    ${b}    ${c}  IN  @{list}
#         Log To Console    ${a} ${b} ${c}
    
#     END

#  lopp inrang - upper limit
#      FOR  ${index}  IN RANGE   10
#          Log To Console  ${index}
     
#      END
       
#  lopp inrang - start & end
#      FOR  ${index}  IN RANGE    0    11
#          Log To Console  ${index}
     
#      END        
    
# Also step given
#     FOR  ${index}  IN RANGE    200    100    -10
#         Log To Console    ${index}
    
#     END

# loop for zip 
#     FOR  ${a}    ${b}    ${c}  IN ZIP    ${num1}    ${num2}    ${num3}
#         Log Many    ${a}    ${b}    ${c}
    
#     END
    
# loop for zip one variable
#     FOR  ${items}    IN ZIP    ${num1}    ${num2}    ${num3}
#         Length Should Be    ${items}    3
#         Log Many    ${items}[0]    ${items}[1]    ${items}[2]
    
#     END

# Exiting for loop
#     FOR  ${var}  IN  a    b    c
#         Run Keyword If    '${var}'=='c'    Exit For Loop
#         Log To Console    ${var}

#         # Exit For Loop If    '${var}'=='c'
#         # Log To Console    ${var}
    
#     END

lopp continue
    FOR  ${i}  IN RANGE    100
        Log To Console    ${i}
        Continue For Loop If    ${i} < 10 
        Log To Console    P
        
    END
    
            