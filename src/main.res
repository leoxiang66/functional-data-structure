open Set
open Tree

let myArray = [1, 2, 3, 4, 5]
let mySet = Set.make(myArray)

Js.log(mySet) // 输出 [|1, 2, 3, 4, 5|]
 

 let tr: Tree.tree<int> = Node(Leaf,5 , Leaf)
 Js.log(Tree.to_list(tr));