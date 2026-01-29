# Parameter Descriptions for term Package

Default parameter descriptions which may be overridden in individual
functions.

## Arguments

- ...:

  These dots are for future extensions and must be empty.

- x:

  The object.

- name:

  A string specifying the name of the parameter.

- validate:

  A string specifying the level of the validation. The possible values
  in order of increasing strictness are 'class', 'valid', 'consistent'
  and 'complete'.

- repair:

  A flag specifying whether to repair terms.

- normalize:

  A flag specifying whether to normalize terms.

- select:

  A character vector of the names of the parameters to include in the
  subsetted object.

- value:

  A character vector of the new parameter names.

- pars:

  A character vector of parameter names.

- scalar:

  A flag specifying whether to by default return all parameters (NULL),
  or only scalar parameters (TRUE) or only non-scalar parameters
  (FALSE).

- terms:

  A flag specifying whether to return the parameter name for each term
  element.

- incomparables:

  Ignored.

## Details

A flag is a non-missing logical scalar.

A string is a non-missing character scalar.
