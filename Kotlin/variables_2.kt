fun main() {
    val distance: Double = 100.0 
    val originalUnit: String = "kilometers" 

    convertDistance(distance, originalUnit, "miles")
    convertDistance(23489.0, "miles", "kilometers")
}

fun convertDistance(distance: Double, originalUnit: String, targetUnit: String){
    when (originalUnit) {
        "kilometers" -> {
            when (targetUnit) {
                "miles" -> {
                    var convertedDistance: Double = distance * 0.621371 
                    println("Original Distance: $distance $originalUnit")
                    println("Converted Distance: $convertedDistance miles") 
                    
					}
                else -> {
                    println("Conversion to $targetUnit not supported.")
                    
                }
            }
        }
        "miles" -> {
            when (targetUnit) {
                "kilometers" -> 
                {                     
                    var convertedDistance: Double = distance * 1.60934
                    println("Original Distance: $distance $originalUnit")
                    println("Converted Distance: $convertedDistance kilometers") 
                }

                else -> {
                    println("Conversion to $targetUnit not supported.")
                   
                }
            }
        }
        else -> {
            println("Conversion from $originalUnit not supported.")
            
        }
    }
}
