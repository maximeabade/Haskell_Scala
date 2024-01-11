object ageXmas2023 {
    def main(args: Array[String]) : Unit = {
        println("Enter day of birth: ")
        val day = scala.io.StdIn.readInt()
        println("Enter month of birth: ")
        val month = scala.io.StdIn.readInt()
        println("Enter year of birth: ")
        val year = scala.io.StdIn.readInt()
        if(month == 12 && day > 25) {
            println("You are " + (2023 - year - 1) + " years old")
        } else {
            println("You are " + (2023 - year) + " years old")
        }
    }
}