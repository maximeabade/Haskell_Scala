object isLeap {
    def isLeapYear(args: Int) : Boolean = {
        return (args % 400 == 0 || (args % 4 == 0 && args % 100 != 0))
    }
}