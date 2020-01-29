Attribute VB_Name = "Module1"
Sub LoopStockInfo()
    'Loop through worksheets variabls
    Dim ws As Integer
    Dim ws_num As Integer
    Dim starting_ws As Worksheet
    Set starting_ws = ActiveSheet
    ws_num = ThisWorkbook.Worksheets.count
    
    For ws = 1 To ws_num
        ThisWorkbook.Worksheets(ws).Activate 'Activate each sheet as we pass through
        Range("I1").Value = "Ticker" 'Set header names
        Range("J1").Value = "Yearly Change"
        Range("L1").Value = "Stock Volume"
        Range("K1").Value = "Percent Change"
        Call PullTicker 'Call module to pull Ticker names and stock volume
        Call PercentChange 'Call module to calculate yearly change and percentage change
        Call HighLowCond 'Call module to format cells
    Next
    
    'starting_ws.Activate
    
    
    
End Sub

Private Sub PullTicker()
'Global variables
    Dim ticker As String
    Dim lastRow As String
    Dim ticker_summary As Integer
    Dim stockVolume As Double
    
    ticker_summary = 2
    lastRow = Cells(Rows.count, 1).End(xlUp).Row
    
    
    
    For i = 2 To lastRow 'loop through the worksheet and pull ticker
            
            If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
                ticker = Cells(i, 1).Value
                Range("I" & ticker_summary).Value = ticker
                Range("L" & ticker_summary).Value = stockVolume
                ticker_summary = ticker_summary + 1
                stockVolume = 0
            Else
                stockVolume = stockVolume + Cells(i + 1, 7).Value
            End If
    Next i
    
    
    

End Sub



Private Sub PercentChange()
 Dim ticker As String
    Dim lastRow As Double 'variable to find final row
    Dim nextTicker As Integer 'next ticker
    Dim annualChange As Double
    Dim openPrc As Double 'first opening price of a ticker
    Dim clsngPrc As Double 'last closing price of a ticker
    Dim perChange As Variant
    Dim count As Double
    Dim countCells As Double
    
    lastRow = Cells(Rows.count, 1).End(xlUp).Row
    'MsgBox (lastRow) - test for the last row
    
    nextTicker = 2
        
    
    For i = 2 To lastRow 'loop through the worksheet and pull ticker
            
            If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then 'If adjacent cells are not equal
                clsngPrc = Cells(i, 6).Value 'last closing value of this ticker
                openPrc = Cells(i - count, 3).Value 'first open value of this ticker
                annualChange = clsngPrc - openPrc 'find the yearly change
                If openPrc = 0 Then 'if statement to test dividing by zero
                    perChange = 0
                Else
                    perChange = ((clsngPrc - openPrc) / openPrc) 'calculate percentage change
                Range("J" & nextTicker).Value = Math.Round(annualChange, 2) 'Set cell for yearly change
                Range("K" & nextTicker).Value = FormatPercent(perChange) 'Set cell(s) for percent change
                nextTicker = nextTicker + 1 'increment to next ticker
                count = 0 'reset count to zero
                End If
            Else
                count = count + 1 'count and increment by one if adjacent cells are same value (subtract number to find first open value)
            End If
        
        
    Next i
End Sub

Private Sub HighLowCond()
Dim lastRow As String
lastRow = Cells(Rows.count, 10).End(xlUp).Row

    For i = 2 To lastRow
        If Cells(i, 10).Value > 0 Then
            Cells(i, 10).Interior.ColorIndex = 4
        ElseIf Cells(i, 10).Value <= 0 Then
            Cells(i, 10).Interior.ColorIndex = 3
        End If
    Next i
    
        
End Sub

Sub SummaryTable()
    Dim maxPer As Double
    Dim minPer As Double
    Dim maxVol As Double
    Dim ticker1 As Integer
    Dim ticker2 As Integer
    Dim ticker3 As Integer
    Dim lastRow As String
    kLastRow = Cells(Rows.count, 12).End(xlUp).Row
    
' Print Max percentage
    maxPer = WorksheetFunction.Max(Range("K2:K797711"))
    Cells(2, 15).Value = "Greatest Increase"
    Cells(2, 17).Value = FormatPercent(maxPer)
    
'Match ticker1 with headers
    ticker1 = WorksheetFunction.Match(maxPer, Range("K2:K797711"), 0)
    Cells(1, 16).Value = "Ticker"
    Cells(2, 16).Value = ticker1
    Cells(2, 16).Value = Cells(ticker1 + 1, 9)
    
    Cells(1, 17).Value = "Value"
    
' Print Min percentage
    minPer = WorksheetFunction.Min(Range("K2:K797711"))
    Cells(3, 15).Value = "Greatest Decrease"
    Cells(3, 17).Value = FormatPercent(minPer)
'Match ticker2
    ticker2 = WorksheetFunction.Match(minPer, Range("K2:K797711"), 0)
    Cells(3, 16).Value = ticker2
    Cells(3, 16).Value = Cells(ticker2 + 1, 9)
' Print Max volume
    maxVol = WorksheetFunction.Max(Range("L2:L797711"))
    Cells(4, 15).Value = "Greatest Total Volume"
    Cells(4, 17).Value = maxVol
 
''Match ticker3
    ticker3 = WorksheetFunction.Match(maxVol, Range("L2:L797711"), 0)
    Cells(4, 16).Value = ticker3
    Cells(4, 16).Value = Sheet3.Cells(ticker3 + 1, 9)
End Sub
