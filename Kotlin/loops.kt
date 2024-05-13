fun main() {
    println("Enter a string:")
    val inputString: String = readLine() ?: ""

    if (inputString.isNotEmpty()) {
        val (minChar: Char, maxChar: Char) = findMinMaxCharacters(inputString)
        println("Minimum character: $minChar")
        println("Maximum character: $maxChar")
    } else {
        println("Input string is empty.")
    }
}

fun findMinMaxCharacters(input: String): Pair<Char, Char> {
    var minChar: Char = input[0]
    var maxChar: Char = input[0]

    for (char in input) {
        if (char < minChar) {
            minChar = char
        }
        if (char > maxChar) {
            maxChar = char
        }
    }

    return Pair(minChar, maxChar)
}
