type rec min_bst<'a> =
  | Empty
  | Node('a, 'a, min_bst<'a>, min_bst<'a>) // (node_value, subtree_min, left, right)

// 创建一个空的min_bst
let createEmptyMinBST = () => Empty

// 插入一个元素到min_bst
let rec insert = (tree: min_bst<'a>, value: 'a) => {
  switch tree {
  | Empty => Node(value, value, Empty, Empty)
  | Node(nodeValue, subtreeMin, left, right) =>
    if value < nodeValue {
      // 插入到左子树，并更新最小值
      let newLeft = insert(left, value)
      let newSubtreeMin = min(value, subtreeMin) // 使用min函数来更新子树的最小值
      Node(nodeValue, newSubtreeMin, newLeft, right)
    } else {
      // 插入到右子树，最小值不变
      let newRight = insert(right, value)
      Node(nodeValue, subtreeMin, left, newRight)
    }
  }
}

// 获取min_bst的最小值
let getMin = (tree: min_bst<'a>) => {
  switch tree {
  | Empty => failwith("Empty tree has no minimum")
  | Node(_, subtreeMin, _, _) => subtreeMin
  }
}

let rec contains = (t: min_bst<'a>, value: 'a) => {
  switch t {
  | Empty => false
  | Node(x, _, left, right) =>
    if value === x {
      true
    } else if value < x {
      contains(left, value)
    } else {
      contains(right, value)
    }
  }
}

let rec printTree = (t: min_bst<'a>) => {
  switch t {
  | Empty => () // 如果是空树，什么也不做
  | Node(x, _, left, right) => {
      printTree(left) // 先打印左子树
      Js.log(x) // 打印当前节点的值
      printTree(right) // 打印右子树
    }
  }
}

let rec remove = (t: min_bst<'a>, value: 'a) => {
  switch t {
  | Empty => Empty
  | Node(x, m, l, r) => if value < m {
      Node(x, m, l, r)
    } else if value < x {
      let newLeft = remove(l, value)
      let newMin = switch newLeft {
      | Empty => x
      | Node(_, m2, _, _) => m2
      }

      Node(x, newMin, newLeft, r)
    } else if value > x {
      Node(x, m, l, remove(r, value))
    } else {
      switch (l, r) {
      | (Empty, Empty) => Empty
      | (Empty, _) => r
      | (_, Empty) => l
      | (Node(_, m1, _, _), Node(_, m2, _, _)) => Node(m2, m1, l, remove(r, m2))
      }
    }
  }
}
