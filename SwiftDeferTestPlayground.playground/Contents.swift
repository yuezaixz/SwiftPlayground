func lookforSomething(name:String) throws{
    //这里是作用域1 整个函数作用域
    
    print("1-1")
    if name == ""{
        //这里是作用域2 if的作用域
        print("2-1")
        defer{
            print("2-2")
        }
        print("2-3")
    }
    print("1-2")
    defer{
        print("1-3")
    }
    print("1-4")
    
    if name == "hello"{
        //作用域3
        print("3-1")
        defer{
            print("3-2")
        }
        print("3-3")
        defer{
            print("3-4")
        }
    }
}

//从两个例子可以看出，作用域结束后会进行一次defer的清算，该作用域中的defer以
//先进后出形式，后定义的会先执行
//切记，一定是作用域结束后进行defer的清算

try! lookforSomething("")
//1-1
//2-1
//2-3
//2-2
//1-2
//1-4
//1-3

try! lookforSomething("hello")
//1-1
//1-2
//1-4
//3-1
//3-3
//3-4
//3-2
//1-3

