open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;

// This operation prepares a qubit in a superposition of |0⟩ and |1⟩ states and then measures it.
operation Superposition() : Result {
    use q = Qubit();
    H(q);
    let result = M(q);
    Reset(q);
    return result;
}