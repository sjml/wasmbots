export interface Point {
    x: number;
    y: number;
}

export class Fraction {
    numerator: number;
    denominator: number;

    constructor(numerator: number, denominator: number) {
        this.numerator = numerator;
        this.denominator = denominator;
        this.reduce();
    }

    reduce() {
        const gcd = (a, b) => (b == 0 ? a : gcd(b, a % b));
        const divisor = gcd(this.numerator, this.denominator);
        this.numerator /= divisor;
        this.denominator /= divisor;
    }

    add(other: Fraction): Fraction {
        const newNum = (this.numerator * other.denominator) + (other.numerator * this.denominator);
        const newDen = this.denominator * other.denominator;
        return new Fraction(newNum, newDen);
    }

    subtract(other: Fraction): Fraction {
        const newNum = (this.numerator * other.denominator) - (other.numerator * this.denominator);
        const newDem = this.denominator * other.denominator;
        return new Fraction(newNum, newDem);
    }

    multiply(other: Fraction): Fraction {
        const newNum = this.numerator * other.numerator;
        const newDen = this.denominator * other.denominator;
        return new Fraction(newNum, newDen);
    }

    divide(other: Fraction): Fraction {
        const newNum = this.numerator * other.denominator;
        const newDen = this.denominator * other.numerator;
        return new Fraction(newNum, newDen);
    }

    toString() {
        return `${this.numerator}/${this.denominator}`;
    }
}
