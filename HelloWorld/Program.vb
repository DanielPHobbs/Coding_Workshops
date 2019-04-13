Imports System

Module Program
    Sub Main(args As String())
        Console.WriteLine("What is your name?")
        Dim Username = Console.ReadLine()
        Console.WriteLine("Hello " + Username + "!")
        Dim now = Date.Now
        Dim dayOfYear = now.DayOfYear
        Console.Write("Day of year: ")
        Console.WriteLine(dayOfYear)

    End Sub
End Module
