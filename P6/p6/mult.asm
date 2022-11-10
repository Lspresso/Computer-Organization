.text
ori $1, $1, 38324
ori $2, $2, 74122
mult $1, $2
mfhi $13
mflo $14
mult $13, $14
mfhi $3
mflo $4
div $3, $4
mfhi $5
mflo $6
div $5, $1
mfhi $7
mflo $8