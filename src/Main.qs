import Std.Random.DrawRandomBool;
import Std.Random.DrawRandomInt;
open Entanglement;
open Superposition;
open Teleportation;
open Microsoft.Quantum.Random;

/// Entry point to the program.
operation Main() : Unit {
    mutable ones = 0;
    mutable zeros = 0;

    for _ in 1..1000 {
        let result = Superposition();
        if (result == One) {
            set ones = ones + 1;
        } else {
            set zeros += 1;
        }
    }

    Message($"=================Superposition.=================");
    Message($"Zeros: {zeros}. Ones: {ones}");

    mutable redOnes = 0;
    mutable redZeros = 0;
    mutable blueOnes = 0;
    mutable blueZeros = 0;
    mutable greenOnes = 0;
    mutable greenZeros = 0;

    for _ in 1..1000 {
        let (result1, result2, result3) = Entanglement();

        if (result1 == One) {
            set redOnes = redOnes + 1;
        } else {
            set redZeros += 1;
        }

        if (result2 == One) {
            set blueOnes = blueOnes + 1;
        } else {
            set blueZeros += 1;
        }

        if (result3 == One) {
            set greenOnes = greenOnes + 1;
        } else {
            set greenZeros += 1;
        }
    }

    Message($"=================Entanglement=================");
    Message($"RedZeros: {redZeros}. RedOnes: {redOnes}");
    Message($"BlueZeros: {blueZeros}. BlueOnes: {blueOnes}");
    Message($"GreenZeros: {greenZeros}. GreenOnes: {greenOnes}");

    mutable trues = 0;
    mutable equals = 0;

    for _ in 1..1000 {
        let sentMessage = DrawRandomInt(0, 1) == 0;
    
        let receivedMessage = Teleportation(sentMessage);
    
        if (receivedMessage) {
            set trues = trues + 1;
        }

        if (sentMessage == receivedMessage) {
            set equals = equals + 1;
        }
    }

    Message($"=================Teleportation=================");
    Message($"  True: {trues}");
    Message($"  False: {1000-trues}");
    Message($"  Equals: {equals/ 1000 * 100}%");
}