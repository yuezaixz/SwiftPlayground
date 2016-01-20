
extension Array {
    subscript(first:Int ,others:Int...) -> ArraySlice<Element> {
        get{
            var result = ArraySlice<Element>()
            result.append(self[first])
            assert(first < self.count, "数组越界，数组长度\(self.count)，输入长度\(first)")
            
            for item in others {
                assert(item < self.count, "数组越界，数组长度\(self.count)，输入长度\(item)")
                result.append(self[item])
            }
            
            return result
        }
        set{
            assert(first < self.count, "数组越界，数组长度\(self.count)，输入长度\(first)")
            self[first] = newValue[0]
            for (index,item) in others.enumerate() {
                assert(item < self.count, "数组越界，数组长度\(self.count)，输入长度\(item)")
                self[item] = newValue[index+1]
            }
        }
    }
}

var arr = [0,1,2,3,4,5,6,7,8]
arr[2,4,6]
arr[3,5,7] = [30,50,90]
