object triangleArea {
    def main(args: Array[String]) : Unit = {
        val a = 3
        val b = 4
        val c = 5
        val p = (a + b + c) / 2
        val area = Math.sqrt(p * (p - a) * (p - b) * (p - c))
        println("Area of triangle is: " + area)
    }
}

