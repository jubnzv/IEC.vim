PROGRAM program0
  LD   x
  MUL  A
  ADD  B
  ST   Y
END_PROGRAM


CONFIGURATION config

  RESOURCE resource1 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM
        instance0 WITH task0 : program0;
    END_PROGRAM
  END_RESOURCE
END_CONFIGURATION
