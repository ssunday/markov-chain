# Markov Chain

This is a [Markov Chain](https://en.wikipedia.org/wiki/Markov_chain) implemented in Common Lisp. It seeds itself on a provided corpus and spits out text of a given length.

## To-Use:

Compile the file. (I just do this within in SLIME using CCL.)

Do `(run corpus length)` where corpus is a text file to feed the Markov Chain and length is the length of the returned text.

`corpus-options` defines three corpuses I have included with this project. They are: *My Man Jeeves*, *Pride and Prejudice*, and some [OANC spoken conversations.](http://www.anc.org/) I do not own these works.

## Examples

*My Man Jeeves* as the corpus, 100 words:

```
 a  fellow  like  that?

Just  out  of  sight  just  as  Voules  came  up  the  gangway.

"Halloa,  George!"  he  said.  "Get  my  letter?"

"I  think  you  are  mistaking  me  for  my  brother,"  said  George.  "My  name  is
Alfred  Lattaker."

"What's  that?"

"I  am  George's  brother  Alfred.  Are  you  my  Uncle  Augustus?"

The  stout  man  stared  at  him.

"You're  very  like  George,"  he  said.

"So  everyone  tells  me."

"And  you're  really  Alfred?"

"I  am."

"I'd  like  to  talk  business  with  you  for  a  curious
                  *

By  Jove,  you  know,  till  I  started  to  tramp  the  place  with  this  infernal
kid,  I  never  had  a  notion  it  would  have

```

*Pride and Prejudice* as the corpus, 100 words:

```
 dare  pronounce  herself  to
be;  though,  when  the  letters  were  read,  Elizabeth  felt  that  she  must  wait
for  her  own  visit  there  to  know  the  rest.

Jane  had  already  written  a  few  lines  on  Wednesday  to  say
that  he  had  arrived  in  safety,  and  to  give  me  away;  and  if  we
were  beyond  the  hour,  we  could  not  be  kept  without  difficulty;  for  the
curiosity  excited  by  his  marrying  me,  it  would  not  be
near  so  much  like  a  ball."

Miss  Bingley  made  no  answer;  but  Lydia,  with  perfect
indifference,  continued  to  express  her  delight,  and  repeat  all  her
former  professions  of  regard.  Jane  was  not  deceived,  but  she  was
affected;
```

OANC spoken conversations, 100 words:

```
Because  if  you  touch  it,  it  made  it  drip.
all  kinds  of  things  like  the  earth  rotated.

In  fact,  I  was  just  really  good  to  me,  I'm  sure  to  anyone  else  it  was  like,  uh,  living  in  France  during  the  Nazi  occupation,  what  it  was  about  three  or  four  weeks  later,  I  was  notified  that  I  had  sisters  so  that  I  can  understand  maybe  girls  a  little  bit  too  much.

```

As you can tell, some of the results are kind of hilarious.

## Issues

Poor performance. Not instantaneous is what I am saying. Reading the file takes a good chunk of the time. Probably depends on how good of a computer you have/compiler.

Jeeves runs the best I would wager, OANC second, and Pride and Prejudice worst. The longer the corpus the slower it is going to be. Just the nature of the beast by raw file size.

The spacing of the returned text is...bizarre sometimes. I tried to clean up input as much as possible when parsing it, but there will be oddities.
