# Inductive general game playing dataset

This repository contains the first version of the GGP dataset, which is discussed in detail in the paper:

A. Cropper, R. Evans, and M. Law. [Inductive general game playing](http://andrewcropper.com/pubs/mlj19-iggp.pdf). Machine learning (accepted).

If you use the dataset for research then please cite the above paper using the reference.

The dataset comprises:

 - data: the actual dataset games folder
 - types: types for the relations in the dataset
 - games: the ground truth GDL programs that we used to generate the dataset

There are 50 games in the initial dataset.

## Data

The data is split into train/validate/test files. For each game, there are four files:

 - <game>_goal.dat: this describes the reward function of the MDP
 - <game>_legal.dat: this describes the available actions for each player
 - <game>_next.dat: this describes the state transition function of the MDP
 - <game>_terminal.dat: this describes the condition under which the episode terminates

Each file has the following structure:

 1. the set of all ground atoms for the target predicate
 2. a set of static background atoms
 3. a list of pairs of the form (background, positives)

#### The set of all ground atoms

This set starts with the "atoms:" keyword. It contains all possible ground atoms using the target predicate. This set is generated from the type definition file.

#### The set of static background atoms

This set starts with the "static:" keyword. It contains all the background atoms that remain true throughout all episodes.

#### The list of pairs of the form (background, positives)

Because we have stored the static background atoms above in (2), for each state we only need to store the dynamic background atoms.  This set starts with the "background:" keyword, but note that this holds only the dynamically changing background facts. The positive atoms start with the "positive:" keyword.

### Recovering a list of (B, P, N) triples from the file

From these files, it is easy to generate a list of (B, P, N) triples where:

 - B is the background atoms
 - P is the positive atoms for the target predicate
 - N is the negative atoms for the target predicate

Let A be the set of all ground atoms (the set beginning with "atoms:"). Let S be the set of static background atoms (the set beginning with "static:"). For each set D of dynamic background atoms (the set starting with the "background:" keyword) and corresponding set P of positive atoms, create a (B, P, N) triple as follows:

 - B := S + D
 - N := A - P
