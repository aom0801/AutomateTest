*** Test Cases ***

if-else basic
    # ค่า input
    ${a}    Set Variable    ${12}
    IF    ${a} == 10
    Log To Console    ${a}
    END
    
    IF    ${a} >= 10 and ${a}<=12
        Log To Console    ${a}
    END

    IF    ${a} >= 10 and ${a}<=12 and ${a} !=12
        Log To Console    ${a}
    END

    IF  ${a}>=9 or ${a} <=3
        Log To Console    ${a}xxxxx
    END

    IF  ${a} >=10
        Log To Console    PASS
    ELSE
        Log To Console    FAIL
    END
    
      IF  ${a}>10
        Log To Console    ${a}
    END