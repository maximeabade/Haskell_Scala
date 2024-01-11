object Main {
  def main(args: Array[String]): Unit = {
    triangleArea.main(Array()) // Call the main method from triangleArea
    val isLeapYear = isLeap.isLeapYear(2024) // Example year, you can change it
    println(s"Is 2024 a leap year? $isLeapYear")
    
    println("Enter birthdate for age calculation:")
    ageXmas2023.main(Array())
  }
}