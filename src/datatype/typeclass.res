module Typeclass = {

    type linorder<'a> = {
    "<": ('a, 'a) => bool,
    "<=": ('a, 'a) => bool,
    ">": ('a, 'a) => bool,
    ">=": ('a, 'a) => bool,
    "==": ('a, 'a) => bool,
    "!=": ('a, 'a) => bool,
    }

    let intLinorder: linorder<int> = {
    "<": (x, y) => x < y,
    "<=": (x, y) => x <= y,
    ">": (x, y) => x > y,
    ">=": (x, y) => x >= y,
    "==": (x, y) => x == y,
    "!=": (x, y) => x != y,
    }

    let floatLinorder: linorder<float> = {
    "<": (x, y) => x < y,
    "<=": (x, y) => x <= y,
    ">": (x, y) => x > y,
    ">=": (x, y) => x >= y,
    "==": (x, y) => x == y,
    "!=": (x, y) => x != y,
    }


}