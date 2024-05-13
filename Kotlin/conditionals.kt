fun main() {
    println("Enter your numeric grade (between 0 and 100):")
    val grade = readLine()?.toIntOrNull()

    if (grade != null && grade in 0..100) {
        val letterGrade = when {
            grade >= 90 -> "A"
            grade in 80..89 -> "B"
            grade in 70..79 -> "C"
            grade in 60..69 -> "D"
            else -> "F"
        }
        println("Your letter grade is: $letterGrade")
    } else {
        println("Invalid input. Please enter a numeric grade between 0 and 100.")
    }
}
