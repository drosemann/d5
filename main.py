class Bruch:  
    def __init__(s): s.z=0;s.n=1  
    def setZaehler(s,z): s.z=z  
    def getZaehler(s): return s.z  
    def setNenner(s,n):  
        if n==0: print("Nenner 0->1"); s.n=1  
        else: s.n=n  
    def getNenner(s): return s.n  
    def setBruch(s,z,n):  
        if n==0: print("Nenner 0->1"); s.n=1  
        else: s.n=n  
    def getBruch(s): return str(s.z)+"/"+str(s.n)  
    def printBruch(s): print(s.z,"/",s.n)  
    def erweitern(s,f): s.z*=f; s.n*=f  
    def kuerzen(s):  
        i=2  
        while i<=s.z and i<=s.n:  
            if s.z%i==0 and s.n%i==0: s.z//=i; s.n//=i  
            else: i+=1    
b1=Bruch()  
b2=Bruch()  
b1.setBruch(2,4)  
b2.setBruch(3,5)  
print("B1:"); b1.printBruch()  
print("B2:"); b2.printBruch()  
a=-1  
while a!=0:  
    print("\n1 Bruch eingeben\n2 Kürzen\n3 Erweitern\n0 Ende")  
    a=int(input("Auswahl:"))  
    if a==1:  
        z=int(input("Zähler:"))  
        n=int(input("Nenner:")) 
        b1.setBruch(z,n); b1.printBruch()  
    elif a==2: b1.kuerzen(); b1.printBruch()  
    elif a==3:  
        f=int(input("Faktor:"))  
        b1.erweitern(f); b1.printBruch()  
print("Ende") 