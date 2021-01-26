import Foundation

extension Array {
    func markPrimes() -> [Int] {
        var result = Array<Int>()
        for index in 2...self.count {
            let map1 = self.mapPrime(index);
            if map1 == 1 {
                result.append(index)
            }
        }
        return result
    }
    // we know 2,3,5,7 are prime
    func isPrime(_ n:Int, _ prime:inout [Int], _ id:Int, _ result:Int)  -> Int {
        if(n >= 4) {return result;}
        let r = result | (id == prime[n] ? 1 : 0);
        return isPrime(n+1, &prime, id, r);
    }

    // find numbers who are factors
    func isPrimeFactor(_ n:Int, _ prime:inout [Int], _ id:Int, _ result:Int) -> Int {
        if(n >= 4) {return result;}
        let r = result & (id % prime[n] != 0 ? 1 : 0);
        return isPrimeFactor(n+1, &prime, id, r);
    }
    func mapPrime(_ id:Int) -> Int {
        if(id < 2) {return 0;}
        var result = 1
        var prime:[Int] = [2,3,5,7];
        if(isPrime(0, &prime, id, 0) == 1) {return result;}
        // bound is square root of "high"
        let a:Double = Double(id)
        let b:Double = sqrt(a)
        let c = Int(floor(b))
        var r = isPrimeFactor(0, &prime, id, 1);
        r &= (b - floor(b) != 0 ? 1 : 0);
        return r;
    }
}

// Driver Program to test above function
func main()
{
    let input = 10;
    print("[INPUT] \(input)");
    let output = Array<Int>(repeating:0, count:input).markPrimes()
    print("[OUTPUT] \(output)");
}
main();
