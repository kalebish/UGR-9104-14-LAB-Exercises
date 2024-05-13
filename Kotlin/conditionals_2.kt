fun main() {
    val originalPrice: Double = 100.0 
    val discountPercentage: Double = 0.6 

    val threshold: Double = 0.5 

    val finalPrice: Double

    if (discountPercentage > threshold) {
        println("The discount percentage is too high. Adjusting to maximum allowed discount.")
        finalPrice = originalPrice * (1 - threshold)
    } else {
        finalPrice = originalPrice * (1 - discountPercentage)
    }

    println("Original Price: $$originalPrice")
    println("Discount Percentage: ${(discountPercentage * 100)}%")
    println("Final Price after Discount: $$finalPrice")
}
