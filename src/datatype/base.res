module Base = {

  type option<'a> = 
  | None 
  | Some('a)


  type result<'a, 'b> = 
  | Ok('a) 
  | Error('b)

}