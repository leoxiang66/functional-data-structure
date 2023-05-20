module Utils = {
    let rec slice = (xs: list<'a>, s: int, l: int): list<'a> => {
        switch (xs, s, l) {
        | (list{}, _, _) => list{}
        | (_, 0, 0) => list{}
        | (list{x,...xss}, 0, l) => list{x, ...slice(xss, 0, l - 1)}
        | (list{_,...xss}, s, l) => slice(xss, s - 1, l)
        }
        }


    let rec printList = (xs: list<'a>) =>{
        switch(xs){
            | list{} => Js.log("\n")
            | list{h,...t} => {
                Js.log(h)
                printList(t)
            }
            }
        }

}