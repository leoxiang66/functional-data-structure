module Base = {

  type number = 
  | Int(int)
  | Float(float)

  type option<'a> = 
  | None 
  | Some('a)


  type result<'a, 'b> = 
  | Ok('a) 
  | Error('b)

}