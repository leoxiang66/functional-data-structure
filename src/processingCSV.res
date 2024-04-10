type student = {
  name: string,
  info: string,
}

type teacher = {
  name: string,
  info: string,
}

type person =
  | Student(student)
  | Teacher(teacher)

let test = `EntityType,EntityName,Description
Teacher, Mr.Jack, Mr.Jack is a high-school teacher in Cambridge.
Student, Mike, Mike likes football`

let result = Js.String.split("\n", test)
let result2: array<array<string>> = []

for i in 0 to Array.length(result) - 1 {
  let splitRow = Js.String.split(",", result[i])
  ignore(Js.Array.push(splitRow, result2))
}

let result3: array<person> = []

for i in 1 to Array.length(result2) - 1 {
  let row = result2[i]
  switch row {
  | ["Teacher", name, info] =>
    let teacher: teacher = {name, info} // 明确标注类型
    ignore(Js.Array.push(Teacher(teacher), result3))
  | ["Student", name, info] =>
    let student: student = {name, info} // 明确标注类型
    ignore(Js.Array.push(Student(student), result3))
  | _ => ()
  }
}

Js.log(result3)


let processPersons = (persons: array<person>) => {
  for i in 0 to Array.length(persons)-1 {
    switch result3[i]{
      | Student(student) => Js.log(`第 i 个 学生: ${student.name ++ student.info}`)
      | Teacher(teacher) => Js.log(`第 i 个 老师: ${teacher.name ++ teacher.info}`)
      | _ => Js.log("错误")
    }
  }
}


processPersons(result3)
