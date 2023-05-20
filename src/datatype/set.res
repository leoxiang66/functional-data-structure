module Set = {
  type t<'a> = array<'a>

  let empty = (): t<'a> => []

  let insert = (~item: 'a, ~set: t<'a>): t<'a> =>
    if (Js.Array.includes(item,set)) {
      set
    } else {
    ignore(Js.Array2.push(set,item))
    set
    }

  let contains = (item: 'a, set: t<'a>): bool =>
    Js.Array.includes(item,set)

  let remove = (~item: 'a, ~set: t<'a>): t<'a> =>{
    Js.Array.filter((i)=> i!=item,set)
    }

  let make = (arr: array<'a>): t<'a> => {
    let ret: t<'a> = empty();
    Js.Array2.forEach(arr,(i)=>ignore(insert(~item=i,~set=ret)))
    ret
  }
}


