### Evaluaión Unidad 1: Arquitectura del computador

## Por: Camilo Ramírez Hernández

## Enunciado
Debes hacer una aplicación en el lenguaje ensamblador estudiado en esta unidad. La aplicación deberá funcionar en un loop infinito. La aplicación lee el teclado y pinta la pantalla de negro si la tecla presionada es la misma almacenada en la posición 0 de la RAM. La aplicación debe borrar la pantalla si la tecla presionada es la misma almacenada en la posición 1 de la RAM. No olvides que la aplicación debe correr en un ciclo infinito.

Una vez crees la aplicación en lenguaje ensamblador y funcione, debes traducirla a lenguaje C/C++ tal como lo realizaste en esta unidad.

## Criterios de evaluación
- Funcionamiento correcto del programa en lenguaje ensamblador 2 unidades.
- Sustentación del programa en lenguaje C/C++ 3 unidades por contestar correctamente las preguntas realizadas a cada miembro del equipo.

## Traduccion a C++

  while (true)
  {
      if (MEMORY[KEYBOARD] != 0)
      {
          if (MEMORY[KEYBOARD] == MEMORY[0])
          {
              MEMORY[17] = -1;
          }
          else if (MEMORY[KEYBOARD] == MEMORY[1])
          {
              MEMORY[17] = 0;
          }
          else
          {
              continue;
          }
          
          for (MEMORY[18] = 16384; MEMORY[18] < 24576; MEMORY[18]++)
          {
              MEMORY[MEMORY[18]] = MEMORY[17];
          }
      }
  }
  
## Explicación del código
- Se inicializa un ciclo "while" para leer el teclado.

(START)			// while (true)
	@KBD
	D=M
	@FILLORCLEAR	// if (kbd != 0)
	D;JNE
	@START
	0;JMP
  
  - Se guarda la entrada del teclado en la posicion "0" y despues en la "1". Dependiendo de la condicion que se haya cumplido pasa a FILL o CLEAR.

  (FILLORCLEAR)
// if key = f --> draw else if key = c --> clear
	@j
	M = D // save key
	@0
	D = D-M
	@FILL
	D;JEQ
	@j
	D = M
	@1
	D = D - M
	@CLEAR
	D;JEQ
	@START
	0;JMP
  
  - Fill llena la pantalla de negro si el valor comparado es igual al que esta en la memoria.
  
  (FILL)
	@value
	M = -1
	@DRAW
	0;JMP
  
  - Clear llena la pantalla de negro si el valor comparado es igual al que esta en la memoria.
  
  (CLEAR)
	@value
	M = 0
	@DRAW
	0;JMP
  
  - Se compara la posicion del pixel actual para pintar.
  
  (DRAW)
	@SCREEN
	D = A
	@i
	M = D
  
  - Este ciclo hace que todo se repita hasta llenar la pantalla
  
  (LOOP)
	@value
	D = M
	@i
	A = M
	M = D
	@i
	M = M + 1
	@24576
	D = A
	@i
	D = M - D
	@LOOP
	D;JNE
	@START
	0;JMP
