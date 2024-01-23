  
        Scenario: load 211 first file
            Given a fund exists with name: "TASE TEST FUND"
             When I load file 2272-0069-0628-231025-01.TASE
              And I log in as "test@test" with password "test123123"
              And  I go to page /tase_orders/ TASE TEST FUND
             Then I should see "01285071"
              And I should see "01285089"
              And I should have 3 tikers for that fund
              And I shoule have 1 log entry in the tase_logs_table
              And I shoule have ftp file with name  2272-0069-0628-231025-01.TASE And content of the following
    "01006900231101010000000000000000000000000000000000000000000000000000061300000000
    02101285071012850892023110120231101000010000000000000000000000000000000000000000
    02301285089000000002023110100000000000000000000000010000010000000000010000000000
    99000040100000400000000000000000000000000000000000000000000000000000000000000000"

  
        Scenario: load second 211 file
            Given a fund exists with name: "TASE TEST FUND"
             When I load file 2272-0069-0611-231025-01.TASE
              And  I load file 2272-0069-0611-231030-01.TASE
              And I log in as "test@test" with password "test123123"
              And  I go to page /tase_orders/
             Then I should see "01285071"
              And I should see "01285089"
              And I should have 3 tikers for that fund
              And I shoule have 2 log entries in the tase_logs_table
              And I shoule have ftp file with name  2272-0069-0628-231025-01.TASE And content of the following
        "01006900231101010000000000000000000000000000000000000000000000000000061300000000
        02101285071012850892023110120231101000010000000000000000000000000000000000000000
        02301285089000000002023110100000000000000000000000010000010000000000010000000000
        99000040100000400000000000000000000000000000000000000000000000000000000000000000"
    
              And I shoule have ftp file with name  2272-0069-0611-231030-01.TASE  And content of the following
        "01006900231101010000000000000000000000000000000000000000000000000000061300000000
        02101285071012850892023110120231101000010000000000000000000000000000000000000000
        02301285089000000002023110100000000000000000000000010000010000000000010000000000
        99000040100000400000000000000000000000000000000000000000000000000000000000000000"



        Scenario: generate alerts when missing 226 files
            Given a fund exists with name: "TASE TEST FUND"
             When I Generte Alert for that fund with kind = "TASE" And message = "לא נשלח 226 עד עתה"
             Then I should have 1 Alert with kind = "TASE" And message = "לא נשלח 226 עד עתה"
              And  I should have 1 opened alert
              And  I should have 0 closed alert
             When I close that alert
              And  I should have 1 Alert
              And  I should have 0 opened alert
              And  I should have 1 closed alert
     



        Scenario: processing 214 file
            Given a fund exists with name: "TASE TEST FUND"
             When I load file 2272-0069-0211-231025-01.TASE
              And  I load file 2272-0069-0211-231030-01.TASE
              And  I generate 213 file with name 2272-0069-0213-231030-01.TASE
              And  I load file 2272-0069-0214-231030-01.TASE
             Then I should have Ticker with id 01285071
              And the ticker 214_content should not be nil





