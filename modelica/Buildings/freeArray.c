/////////////////////////////////////////////////////
//
// This function is a copy of the file in 
// Resources/C-Sources, because Dymola 2012 for Linux
// does not seem to parse the 
// IncludeDirectory="modelica://Buildings/Resources/C-Sources"
// annotation.
//
/////////////////////////////////////////////////////
// Modelica external function that frees the memory
// that is allocated by initArray.c or by
// storeValue.c
//
/////////////////////////////////////////////////////
// When called by the Modelica function "initArray", 
// this function creates a structure for an array whose
// number of elements can be enlarged.
//
// Pierre Vigouroux, LBNL                  7/18/2011 
/////////////////////////////////////////////////////
void freeArray(void* object)
{ /* Release table storage */
  if ( object != NULL ){
    ExternalObjectStructure* table = (ExternalObjectStructure*) object;
    free(table->x);
    free(table->n);
    free(table);
  }
}
