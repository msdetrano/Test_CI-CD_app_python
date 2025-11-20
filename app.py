# app.py
def somar(a, b):
    # Variavel nao usada (Code Smell)
    resultado_inutil = 0 
    
    # Comparacao que sempre da verdade (Bug)
    if (a == a):
        return a + b

print(somar(10, 20))