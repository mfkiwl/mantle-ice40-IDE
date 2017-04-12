from magma import *
from mantle import *
from loam.boards.icestick import IceStick


def test_bit():
    @circuit
    def circ(a : In(Bit), b : In(Bit), c : Out(Bit)):
        c = a + b

    expected = \
"""from magma import *
from mantle import *
circ = DefineCircuit("circ", "a", In(Bit), "b", In(Bit), "c", Out(Bit))
inst1 = Add(1)(circ.a, circ.b)
wire(circ.c, inst1)
EndCircuit()
"""
    assert circ.__magma_source == expected

def test_array():
    @circuit
    def circ(a : In(Array(5, Bit)), b : In(Array(5, Bit)), c : Out(Array(5, Bit))):
        c = a + b

    expected = \
"""from magma import *
from mantle import *
circ = DefineCircuit("circ", "a", In(Array(5, Bit)), "b", In(Array(5, Bit)), "c", Out(Array(5, Bit)))
inst1 = Add(5)(circ.a, circ.b)
wire(circ.c, inst1)
EndCircuit()
"""
    assert circ.__magma_source == expected

def test_sub():
    @circuit
    def circ(a : In(Array(5, Bit)), b : In(Array(5, Bit)), c : Out(Array(5, Bit))):
        c = a - b

    expected = \
"""from magma import *
from mantle import *
circ = DefineCircuit("circ", "a", In(Array(5, Bit)), "b", In(Array(5, Bit)), "c", Out(Array(5, Bit)))
inst1 = Sub(5)(circ.a, circ.b)
wire(circ.c, inst1)
EndCircuit()
"""
    assert circ.__magma_source == expected

def test_logic_ops():
    @circuit
    def circ(a : In(Array(5, Bit)), b : In(Array(5, Bit)), c : Out(Array(5, Bit))):
        c = ~((a | b ^ a) & b)
    expected = \
"""from magma import *
from mantle import *
circ = DefineCircuit("circ", "a", In(Array(5, Bit)), "b", In(Array(5, Bit)), "c", Out(Array(5, Bit)))
inst1 = Xor(2, width=5)(circ.b, circ.a)
inst2 = Or(2, width=5)(circ.a, inst1)
inst3 = And(2, width=5)(inst2, circ.b)
inst4 = Invert(5)(inst3)
wire(circ.c, inst4)
EndCircuit()
"""
    assert circ.__magma_source == expected
