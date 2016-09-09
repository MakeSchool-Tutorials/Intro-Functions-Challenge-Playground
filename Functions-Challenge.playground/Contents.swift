/*:
 ![Make School Banner](./swift_banner.png)
 # Efficiently Lazy

 Finals are coming up, and Morty wants to know how much he needs to study. According to the syllabus, Morty's final grade is calculated using the following constraints:

 - **Homework:** 20%
 - **Quizzes:** 25%
 - **Tests:** 30%
 - **Midterm:** 10%
 - **Final Exam:** 15%

 Morty's current grades are:

 - **Homework:** 100, 100, 100, 85, 65, 100, 100, 100, 0, 105, 105
 - **Quizzes:** 93, 87, 100, 100, 100, 72
 - **Tests:** 98, 92, 75, 80
 - **Midterm:** 85
 - **Final exam:** ???

 ----

 ## 1. Calculate Morty's current grade.

 - callout(Challenge): Create a function called `calculateMortysGrade`. It should take no arguments and return Morty's _current grade_ as a `Double`. The final exam should not be included in this calculation!
 
 
 - note: Store Morty's current grade in the `let` constant `mortyGradeWithoutFinal`.

*/


func calculateMortysGrade() -> Double {
    let homework: Double = 100 + 100 + 100 + 85 + 65 + 100 + 100 + 100 + 0 + 105 + 105
    let quizzes: Double = 93 + 87 + 100 + 100 + 100 + 72
    let tests: Double = 98 + 92 + 75 + 80
    let midterm: Double = 85
    
    let homeworkAverage = homework / 11.0
    let quizzesAverage = quizzes / 6.0
    let testsAverage = tests / 4.0
    let midtermAverage = midterm / 1.0
    
    // We want the grade without the final exam counting against Morty -- he hasn't taken it yet!
    return ((homeworkAverage * 0.20) + (quizzesAverage * 0.25) + (testsAverage * 0.30) + (midtermAverage * 0.10)) / (1.0 - 0.15)
}

let mortyGradeWithoutFinal = calculateMortysGrade()


/*:

 ----
 
## 2. Calcuate the lowest score Morty can earn on the final while still earning an *A* in the class.

 - callout(Challenge): Create a function called `calculateMortysFinalExamGradeNeeded` with an arugment of `gradeWithoutFinal`. It should return the grade Morty needs to earn on the final to earn an *A* in the class. Assume that Morty's final grade needs to be at least 89.5 points to earn an *A*.
 
 
 - note: Store the grade Morty needs on his final exam in the variable `mortyFinalNeeded`.

*/


func calculateMortysFinalExamGradeNeeded(gradeWithoutFinal: Double) -> Double {
    return (89.5 - gradeWithoutFinal * 0.85) / 0.15
}

let mortyFinalNeeded = calculateMortysFinalExamGradeNeeded(gradeWithoutFinal: mortyGradeWithoutFinal)


/*:
 
 ----
 
 ## 3. Help out your classmates.

 Your classmates found out about your final exam grade calculator and want you to help them calculate the scores they need on their final exams.

 Create two functions:

 1. `calculateGradeWithoutFinalExam`
 2. `calculateFinalExamGradeNeeded`

 You should be able to use these two functions for all four scenarios below!
 
 - important: These functions might need a lot of parameters. That is okay! Start on paper and plan out your approach before you code!

 ----

 ### a. Beth wants to earn 97 points for an A+.

 - **Homework:** 100 points _(20%)_
 - **Quizzes:** 100 points _(20%)_
 - **Tests:** 100 points _(20%)_
 - **Midterm:** 100 points _(20%)_
 - **Final Exam:** ??? points _(20%)_
 
 - note: Store Beth's current grade in `bethGradeWithoutFinal` and the score she  needs on her final exam in the variable `bethFinalNeeded`.

*/


func calculateGradeWithoutFinalExam(homeworkGrade: Double, homeworkWeight: Double, quizGrade: Double, quizWeight: Double, testGrade: Double, testWeight: Double, midtermGrade: Double, midtermWeight: Double) -> Double {
    let homework = homeworkGrade * homeworkWeight
    let quiz = quizGrade * quizWeight
    let test = testGrade * testWeight
    let midterm = midtermGrade * midtermWeight
    return (homework + quiz + test + midterm) / (homeworkWeight + quizWeight + testWeight + midtermWeight)
}

func calculateFinalExamGradeNeeded(gradeWithoutFinal: Double, finalExamWeight: Double, targetGrade: Double) -> Double {
    return (targetGrade - gradeWithoutFinal * (1 - finalExamWeight)) / finalExamWeight
}

let bethGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 100, homeworkWeight: 0.20, quizGrade: 100, quizWeight: 0.20, testGrade: 100, testWeight: 0.20, midtermGrade: 100, midtermWeight: 0.20)

let bethFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: bethGradeWithoutFinal, finalExamWeight: 0.20, targetGrade: 97)


/*:
 
 ----

 ### b. Jerry wants to earn 80 points for a B.

 - **Homework:** 91 points _(20%)_
 - **Quizzes:** 72 points _(25%)_
 - **Tests:** 77 points _(25%)_
 - **Midterm:** 64 points _(10%)_
 - **Final Exam:** ??? points _(20%)_

 - note: Store Jerry's current grade in `jerryGradeWithoutFinal` and the score he needs on his final exam in the variable `jerryFinalNeeded`.
 
*/


let jerryGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 91, homeworkWeight: 0.20, quizGrade: 72, quizWeight: 0.25, testGrade: 77, testWeight: 0.25, midtermGrade: 64, midtermWeight: 0.10)

let jerryFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: jerryGradeWithoutFinal, finalExamWeight: 0.20, targetGrade: 80)


/*:
 
 ----

 ### c. Summer wants to earn 89.5 points for an A.

 - **Homework:** 94 points _(20%)_
 - **Quizzes:** 89 points _(25%)_
 - **Tests:** 83 points _(30%)_
 - **Midterm:** 93 points _(10%)_
 - **Final Exam:** ??? points _(15%)_

 - note: Store Summer's current grade in `summerGradeWithoutFinal` and the score she  needs on her final exam in the variable `summerFinalNeeded`.
 
*/


let summerGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 94, homeworkWeight: 0.20, quizGrade: 89, quizWeight: 0.25, testGrade: 83, testWeight: 0.30, midtermGrade: 93, midtermWeight: 0.10)

let summerFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: summerGradeWithoutFinal, finalExamWeight: 0.15, targetGrade: 89.5)


/*:
 
 ----

 ### d. Rick doesn't care about school. He's fine earning 70 points for a C.

 - **Homework:** 0 points _(10%)_
 - **Quizzes:** 20 points _(10%)_
 - **Tests:** 33.33 points _(15%)_
 - **Midterm:** 100 points _(10%)_
 - **Final Exam:** ??? points _(55%)_
 
 - note: Store Rick's current grade in `rickGradeWithoutFinal` and the score he  needs on his final exam in the variable `rickFinalNeeded`.

*/


let rickGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 0, homeworkWeight: 0.10, quizGrade: 20, quizWeight: 0.10, testGrade: 33.33, testWeight: 0.15, midtermGrade: 100, midtermWeight: 0.10)

let rickFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: rickGradeWithoutFinal, finalExamWeight: 0.55, targetGrade: 70)


/*:
 
 ----

 ## 4. Format the results!

 It's time to create a function to format the results into _Strings_.
 
 - important: "Printing" is a programming term that means "output to the console". We are not talking about printing it to paper! To view the console, press this button on the top right. ![Open console](./print_console.png)
 
     An empty white box should have appeared at the bottom of your editor! How do you actually "print" to this area? You use the `print` function. `print` takes a single argument -- a `String`.
     
     If you call `print("Hello, Make School!")` then you will see `Hello, Make School!` in the console.
     
     Now... you might be wondering, how do you inject variable values into a `String`? We do this with "string interpolation". If you have the following:
     
         let number: Int = 5
         print("My number is \(number), it is one less than \(number + 1)")
     
     Then it would print `My number is 5, it is one less than 6` to the console. You can add as many of the `\(expression)` interpolations into your string as you would like. Try it out and complete the challenge below :)

 
 - callout(Challenge): Create a function that returns a fully formatted string. Use that function to _print_ each person's current grade and final exam grade needed (including Morty) to the console with the format: "_name_ currently has _gradeWithoutFinal_ points and needs to earn at least _finalExamGradeNeeded_ points on the final exam to be happy."

*/


func formattedResult(studentName: String, gradeWithoutFinal: Double, finalExamGradeNeeded: Double) -> String {
    
    return "\(studentName) currently has \(gradeWithoutFinal) points and needs to earn at least \(finalExamGradeNeeded) points on the final exam to be happy."
}

print(formattedResult(studentName: "Morty", gradeWithoutFinal: mortyGradeWithoutFinal, finalExamGradeNeeded: mortyFinalNeeded))
print(formattedResult(studentName: "Beth", gradeWithoutFinal: bethGradeWithoutFinal, finalExamGradeNeeded: bethFinalNeeded))
print(formattedResult(studentName: "Jerry", gradeWithoutFinal: jerryGradeWithoutFinal, finalExamGradeNeeded: jerryFinalNeeded))
print(formattedResult(studentName: "Summer", gradeWithoutFinal: summerGradeWithoutFinal, finalExamGradeNeeded: summerFinalNeeded))
print(formattedResult(studentName: "Rick", gradeWithoutFinal: rickGradeWithoutFinal, finalExamGradeNeeded: rickFinalNeeded))






