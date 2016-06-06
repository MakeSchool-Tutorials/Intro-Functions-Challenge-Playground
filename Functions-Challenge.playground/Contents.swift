/*:

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
    let homework = [100, 100, 100, 85, 65, 100, 100, 100, 0, 105, 105]
    let quizzes = [93, 87, 100, 100, 100, 72]
    let tests = [98, 92, 75, 80]
    let midterm = [85]
    
    let homeworkAverage = Double(homework.reduce(0) { $0 + $1 }) / Double(homework.count)
    let quizzesAverage = Double(quizzes.reduce(0) { $0 + $1 }) / Double(quizzes.count)
    let testsAverage = Double(tests.reduce(0) { $0 + $1 }) / Double(tests.count)
    let midtermAverage = Double(midterm.reduce(0) { $0 + $1 }) / Double(midterm.count)

    return (homeworkAverage * 0.20) + (quizzesAverage * 0.25) + (testsAverage * 0.30) + (midtermAverage * 0.10)
}

let mortyGradeWithoutFinal = calculateMortysGrade()


/*:

 ----
 
## 2. Calcuate the lowest score Morty can earn on the final while still earning an *A* in the class.

 - callout(Challenge): Create a function called `calculateMortysFinalExamGradeNeeded` with an arugment of `gradeWithoutFinal`. It should return the grade Morty needs to earn on the final to earn an *A* in the class. Assume that Morty's final grade needs to be at least 89.5 points to earn an *A*.
 
 - note: Store the grade Morty needs on his final exam in the variable `mortyFinalNeeded`.

*/
func calculateMortysFinalExamGradeNeeded(gradeWithoutFinal gradeWithoutFinal: Double) -> Double {
    
    return (89.5 - gradeWithoutFinal) * (100 / 15.0)
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
func calculateGradeWithoutFinalExam(homeworkGrade homeworkGrade: Double, homeworkConstraint: Double, quizGrade: Double, quizConstraint: Double, testGrade: Double, testConstraint: Double, midtermGrade: Double, midtermConstraint: Double) -> Double {
    
    return (homeworkGrade * homeworkConstraint/100) + (quizGrade * quizConstraint/100) + (testGrade * testConstraint/100) + (midtermGrade * midtermConstraint/100)
}

func calculateFinalExamGradeNeeded(gradeWithoutFinal gradeWithoutFinal: Double, finalExamConstraint: Double, gradeBandTarget: Double) -> Double {
    return (gradeBandTarget - gradeWithoutFinal) * (100 / finalExamConstraint)
}

let bethGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 100, homeworkConstraint: 20, quizGrade: 100, quizConstraint: 20, testGrade: 100, testConstraint: 20, midtermGrade: 100, midtermConstraint: 20)


let bethFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: bethGradeWithoutFinal, finalExamConstraint: 20, gradeBandTarget: 97)

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

let jerryGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 91, homeworkConstraint: 20, quizGrade: 72, quizConstraint: 25, testGrade: 77, testConstraint: 25, midtermGrade: 64, midtermConstraint: 10)


let jerryFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: jerryGradeWithoutFinal, finalExamConstraint: 20, gradeBandTarget: 80)


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

let summerGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 94, homeworkConstraint: 20, quizGrade: 89, quizConstraint: 25, testGrade: 83, testConstraint: 30, midtermGrade: 93, midtermConstraint: 10)


let summerFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: summerGradeWithoutFinal, finalExamConstraint: 15, gradeBandTarget: 89.5)



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

let rickGradeWithoutFinal = calculateGradeWithoutFinalExam(homeworkGrade: 0, homeworkConstraint: 10, quizGrade: 20, quizConstraint: 10, testGrade: 33.33, testConstraint: 15, midtermGrade: 100, midtermConstraint: 10)


let rickFinalNeeded = calculateFinalExamGradeNeeded(gradeWithoutFinal: rickGradeWithoutFinal, finalExamConstraint: 55, gradeBandTarget: 70)


/*:
 
 ----

 ## 4. Format the results!

 It's time to create a function to format the results into _Strings_.

 - challenge: Create a function that returns a fully formatted string. Print each person's current grade and final exam grade needed (including Morty) to the console with the format: "_name_ currently has _gradeWithoutFinal_ points and needs to earn at least _finalExamGradeNeeded_ points on the final exam to be happy."

*/
func prettyResult(gradeWithoutFinal gradeWithoutFinal: Double, finalExamGradeNeeded: Double, studentName: String) -> String {
    
    return "\(studentName) currently has \(gradeWithoutFinal) points and needs to earn at least \(finalExamGradeNeeded) points on the final exam to be happy."
}

print(prettyResult(gradeWithoutFinal: mortyGradeWithoutFinal, finalExamGradeNeeded: mortyFinalNeeded, studentName: "Morty"))
print(prettyResult(gradeWithoutFinal: bethGradeWithoutFinal, finalExamGradeNeeded: bethFinalNeeded, studentName: "Beth"))
print(prettyResult(gradeWithoutFinal: jerryGradeWithoutFinal, finalExamGradeNeeded: jerryFinalNeeded, studentName: "Jerry"))
print(prettyResult(gradeWithoutFinal: summerGradeWithoutFinal, finalExamGradeNeeded: summerFinalNeeded, studentName: "Summer"))
print(prettyResult(gradeWithoutFinal: rickGradeWithoutFinal, finalExamGradeNeeded: rickFinalNeeded, studentName: "Rick"))









