--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    num integer,
    page integer,
    qtext text,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    answer text
);


ALTER TABLE public.questions OWNER TO action;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO action;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: questions_topics; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE questions_topics (
    question_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.questions_topics OWNER TO action;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO action;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE topics (
    id integer NOT NULL,
    "topicName" character varying(255),
    comments text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.topics OWNER TO action;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO action;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: action
--

COPY questions (id, num, page, qtext, notes, created_at, updated_at, answer) FROM stdin;
14	10	1	Wes bought some school supplies at an outlet store in Maine, a state that has a 6.5% sales tax. Including the sales tax, how much did Wes pay for two blazers priced at $49.95 each and 3 pairs of pants priced at $17.50 each?		2014-07-07 06:29:17.415032	2014-07-07 06:29:17.415032	((2 * 49.95) + ( 3 * 17.50)) * 1.065 = 162.31
15	11	1	(Continuation) A familiar feature of arithmetic is that multiplication distributes over addition. Written in algebraic code, this property looks like a(b+c) = ab+ac. Because of this property, there are two equivalent methods that can be used to compute the answer in the previous problem. Explain, using words and complete sentences.		2014-07-07 06:31:19.432972	2014-07-07 06:31:19.432972	You can either find the price of each individual item and figure the tax, or you can find the pre-tax total and then figure the tax. It ends up the same due to the distributive property.
16	2	2	Pick any number. Add 4 to it and then double your answer. Now subtract 6 from that result and divide your new answer by 2. Write down your answer. Repeat these steps with another number. Continue with a few more numbers, comparing your final answer with your original number. Is there a pattern to your answers?		2014-07-07 14:57:52.426665	2014-07-07 14:57:52.426665	1 -> 2\r\n2 -> 3\r\n100 -> 101\r\n\r\n(2(x+4)-6)/2\r\n(2x+2)/2\r\nx+1
17	3	2	Using the four integers 2, 3, 6 and 8 once each — in any order — and three arithmetic operations selected from among addition, subtraction, multiplication, and division, write expressions whose values are the target numbers given below. You will probably need to use parentheses. For example, to hit the target 90, you could write 90 = (3 + 6) · (8 + 2). \r\n\r\n(a) 3 (b) 24 (c) 36 (d) 30	Trial and error/Pattern building\r\nSee what other numbers can be made from pairs, triplets	2014-07-07 15:12:05.863401	2014-07-07 15:12:05.863401	(a)  2+3+6-8 = 3\r\n(b) (3*6)-2+8 = 24\r\n(c) (2*6*9)/3 = 36\r\n(d) ((2*8)-6)*3 = 30
18	4	2	When describing the growth of a population, the passage of time is sometimes described in generations, a generation being about 30 years. One generation ago, you had two ancestors (your parents). Two generations ago, you had four ancestors (your grandparents). Ninety years ago, you had eight ancestors (your great-grandparents). How many ancestors did you have 300 years ago? 900 years ago? Do your answers make sense?	Powers of two	2014-07-08 03:41:23.04528	2014-07-08 03:41:23.04528	g1 - 2    -  30 years\r\ng2 - 4    -  60 years\r\ng3 - 8    -  90 years\r\ng4 - 16   - 120 years\r\ng5 - 32   - 150 years\r\ng6 - 64   - 180 years\r\ng7 - 128  - 210 years\r\ng8 - 256  - 240 years\r\ng9 - 512  - 270 years\r\ng10- 1,024- 300 years = 2^10\r\ng30-        900 years = 2^30 = 1,073,741,824\r\n\r\nIt doesn't make sense as there probably weren't even 1 billion humans alive 900 years ago; the number is probably much lower due to common ancestors.\r\n
3	1	2	Woolworth’s had a going-out-of-business sale. The price of a telephone before the sale was $39.98. What was the price of the telephone after a 30% discount? If the sale price of the same telephone had been $23.99, what would the (percentage) discount have been?	Percentage review	2014-02-14 17:14:06.59592	2014-07-05 06:08:14.346362	39.99 * .7,\r\n\r\n(39.99-23.99)/39.99
1	1	1	Light travels at about 186 thousand miles per second, and the Sun is about 93 million miles from the Earth. How much time does light take to reach the Earth from the Sun?		2014-02-14 17:13:05.764503	2014-07-05 06:14:52.00225	93,000,000/186,000 = # of seconds it takes = 500\r\n500/60 = 8 minutes 20 seconds
2	2	1	How long would it take you to count to one billion, reciting the numbers one after another? First write a guess into your notebook, then come up with a thoughtful answer. One approach is to actually do it and have someone time you, but there are more manageable alternatives. What assumptions did you make in your calculations?	Easy to make mistakes when dealing with very large numbers.	2014-02-14 17:13:41.019212	2014-07-05 06:21:24.866224	It's going to take a long time, since almost all of the numbers are greater than 1 million and it takes several seconds just to say one very large number. If the average number takes about 5 seconds, it would take around 5 billion seconds. 5,000,000,000/(60*60*24*365) gives an estimate of about 158 years.
7	3	1	It takes 1.25 seconds for light to travel from the Moon to the Earth. How many miles away is the Moon?	The orbit is elliptical, not round, so this is at best an approximation, or more strictly speaking the distance from the earth to the moon isn't a constant value.	2014-07-07 05:52:27.924879	2014-07-07 05:52:27.924879	186000*1.25=232,500 miles
8	4	1	Many major-league baseball pitchers can throw the ball at 90 miles per hour. At that \r\nspeed, how long does it take a pitch to travel from the pitcher’s mound to home plate, a distance of 60 feet 6 inches? Give your answer to the nearest hundredth of a second. There are 5280 feet in a mile.	What's the difference in time for a 79mph curveball?	2014-07-07 06:01:42.069819	2014-07-07 06:02:08.124077	90mph*5280 = 475,200fph/60  = 7920fpm/60 = 132 fps\r\n132/60.5 = 2.18 seconds\r\n
9	5	1	You have perhaps heard the saying, “A journey of 1000 miles begins with a single step.” How many steps would you take to finish a journey of 1000 miles? What information do you need in order to answer this question? Find a reasonable answer. What would your answer be if the journey were 1000 kilometers?	Again, values are under the control of the stepper.	2014-07-07 06:06:28.481688	2014-07-07 06:06:28.481688	How long is a step? Estimate 2.5 feet per step.\r\n5280/2.5 = 2,112 steps per mile, or 2,112,000 for a thousand miles.\r\nI km = ~.625 miles, so ~1,320,000 steps for 1,000 km. 
10	6	1	In an offshore pipeline, a cylindrical mechanism called a “pig” is run through the pipes periodically to clean them. These pigs travel at 2 feet per second. What is this speed, expressed in miles per hour?		2014-07-07 06:15:33.530602	2014-07-07 06:15:33.530602	2 fps = 2 * 60 * 60 or 7200 fph.\r\n7200/5280 = 1.3636 mph.
11	7	1	Your class sponsors a benefit concert and prices the tickets at $8 each. Dale sells 12 tickets, Andy 16, Morgan 17, and Pat 13. Compute the total revenue brought in by these four persons. Notice that there are two ways to do the calculation.		2014-07-07 06:19:03.256325	2014-07-07 06:19:03.256325	(12+15+17+13) * 8 or\r\n12*8 + 16*8 + 17*8 + 13*8\r\n$464
12	8	1	Kelly telephoned Brook about a homework problem. Kelly said, “Four plus three times two is 14, isn’t it?” Brook replied, “No, it’s 10.” Did someone make a mistake? Can you explain where these two answers came from?		2014-07-07 06:21:54.709149	2014-07-07 06:21:54.709149	Depends on order of operations, without parentheses it isn't clear if it is (4+3)*2 or 4+(3*2), though the latter could be argued to be correct under strict PEMDAS interpretation.
19	5	2	On a recent episode of Who Wants to Be a Billionaire, a contestant was asked to\r\narrange the following five numbers in increasing order. You try it, too.\r\n(a) 2/3 (b) 0.6666 (c) 3/5 (d) 0.666 (e) 0.67		2014-07-08 03:45:23.715799	2014-07-08 03:45:23.715799	a = 0.66667  (approximation)\r\nb = 0.66660\r\nc = 0.60000\r\nd = 0.66600\r\ne = 0.67000\r\n\r\nc, d, b, a, e
13	9	1	It is customary in algebra to omit multiplication symbols whenever possible. For example, 11x means the same thing as 11 · x. Which of the following can be condensed by leaving out a multiplication symbol? (a) 4 · 1/3  (b) 1.08 · p (c) 24 · 52 (d) 5 · (2 + x)\r\n	a would look like 4.33\r\nc would look like 2452	2014-07-07 06:26:23.749204	2014-07-07 15:44:01.833295	b - 1.08p\r\nd - 5(2+x)\r\n
20	6	2	The area of a circle whose radius is r is given by the expression r2. Find the area of each of the following circles to the nearest tenth of a square unit of measure:\r\n(a) a circle whose radius is 15 cm (b) a circle whose radius is 0.3 miles	How many decimals of pi to use?	2014-07-08 03:49:45.821713	2014-07-08 03:49:45.821713	a. 707.5 cm^2 or 706.8 with more accurate pi\r\nb. 0.3 mi^2
21	7	2	Choose any number. Double it. Subtract six and add the original number. Now divide by three. Repeat this process with other numbers, until a pattern develops. By using a variable such as x in place of your number, show that the pattern does not depend on which number you choose initially.		2014-07-08 03:54:11.084972	2014-07-08 03:54:11.084972	5*2 = 10\r\n10 - 6 = 4\r\n4 + 5 = 9\r\n9/3 = 3\r\n\r\n(2x - 6 + x )/3 -> (3x - 6)/3 -> x - 2
22	8	2	Explain why there are two ways to compute each of the following:\r\n(a) 3(2 + 3 + 5) \r\n(b) 1/3*(9 + 6 − 3) \r\n(c) (9 + 6 − 3) ÷ 3\r\n		2014-07-08 03:56:59.589915	2014-07-08 03:56:59.589915	Either distribute across the terms, or find the value within the parentheses and then apply the outside term.
23	9	2	Given the information w = 4 inches and h = 7 inches, find two ways to evaluate 2w + 2h. What is the geometric significance of this calculation?		2014-07-08 03:59:35.277779	2014-07-08 03:59:35.277779	(2*4)+(2*7) or 2(4+7)\r\nPerimeter, assuming w is width and h height of a rectangle.
24	10	2	Simplify x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2.		2014-07-08 04:00:25.307589	2014-07-08 04:00:25.307589	9x + 18
25	11	2	Without resorting to decimals, find equivalences among the following nine expressions:\r\n(2·3)/5    (3/5)·2    3·(2/5)   (2/5)(3/3)   (5/3)2   2÷(5/3)  2/5  (5/3)÷(1/2)  3/(5/2)		2014-07-08 04:10:00.062833	2014-07-08 04:10:00.062833	18/15   18/15   18/15   6/15    50/15    18/15    6/15    50/15    18/15
26	1	3	What is the value of 3 + (−3)? What is the value of (−10.4) + 10.4? These pairs of numbers are called opposites. What is the sum of a number and its opposite? Does every number have an opposite? State the opposite of:\r\n(a) −2.341 (b) 1/3 (c) x (d) x + 2 (e) x − 2		2014-07-08 15:41:41.391709	2014-07-08 15:41:41.391709	Sums are 0\r\n0 has no opposite, except perhaps 0\r\n2.34   -1/3     -x     -(x+2)   -(x-2)
27	2	3	As shown on the number line below, k represents an unknown number between 2 and\r\n3. Plot each of the following, extending the line if necessary:\r\n(a) k + 3 (b) k − 2 (c) −k (d) 6 − k\r\n\r\n----|----|----|----|----|----|--.-|----|----|----|----\r\n   -3   -2   -1    0    1`   2  k 3    4    5    6		2014-07-08 15:46:57.729952	2014-07-08 15:49:49.520129	----|-.--|----|----|--.-|----|--.-|-.--|----|--.-|----\r\n   -3   -2   -1    0    1`   2  k 3    4    5    6
40	1	5	Use the balance diagram below to find how many marbles it takes to balance one cube.\r\n\r\ncccmmmmmmm    ccccc  m\r\n----------   -----------\r\n     |-----------|\r\n           ^		2014-07-09 04:37:30.095672	2014-07-09 04:46:36.025782	3 cubes and 7 marbles balance 5 cubes and 1 marble\r\nIt would still balance if you took away 3 cubes from each side.\r\nThen there would be 7 marbles on the left and 2 cubes and 1 marble on the right\r\nTake away 1 marble from each side, still balances\r\n6 marbles on the left, 2 cubes on the right\r\nThus 3 marbles weighs the same as 1 cube.
43	4	5	What is the value of 2/3· 3/2? \r\nWhat is the value of 4 · 1/4? \r\nThese pairs of numbers are called reciprocals. What is the product of a number and its reciprocal? Does every number have a reciprocal? State the reciprocal of the following:\r\n(a) 5/3\r\n(b) −1/2\r\n(c) 2000 \r\n(d) a/b\r\n(e) 1.2 \r\n(f) x		2014-07-10 02:02:48.403589	2014-07-10 02:03:53.359232	1,1 \r\n0 doesn't have a reciprocal as division by zero is undefined\r\na) 3/5\r\nb) -2\r\nc) 1/2000\r\nd) b/a\r\ne) 1/1.2\r\nf) 1/x
44	5	5	Here is another number puzzle: Pick a number, add 5 and multiply the result by 4. Add another 5 and multiply the result by 4 again. Subtract 100 from your result and divide your answer by 8. How does your answer compare to the original number? You may need to do a couple of examples like this until you see the pattern. Use a variable for the chosen number and show how the pattern holds for any number.		2014-07-10 02:06:39.062544	2014-07-10 02:06:39.062544	5,10,40,45,180,80,10\r\nTwice the original number\r\nx, x+5, 4x + 20, 4x + 25, 16x + 100, 16x, 2x
45	6	5	(Continuation) Make up a number puzzle of your own. Be able to verify the pattern using a variable for the number chosen initially.		2014-07-10 02:10:30.265872	2014-07-10 02:10:30.265872	Pick a number. Double it. Add 10. Double it again. Subtract 20. Divide by 2.\r\n\r\nx, 2x, 2x + 10, 4x + 20, 4x, 2x\r\n\r\n2, 4, 14, 28, 8, 4
46	7	5	Jess takes a board that is 50 inches long and cuts it into two pieces, one of which is 16 inches longer than the other. How long is each piece?		2014-07-10 02:11:09.144842	2014-07-10 02:42:59.402709	33 and 17 inches.\r\nOne is 8 more than 25 and the other 8 less.
47	8	5	Consider the sequence of numbers 2; 5; 8; 11; 14; : : : , in which each number is three more than its predecessor.\r\n(a) Find the next three numbers in the sequence.\r\n(b) Find the 100th number in the sequence.\r\n(c) Using the variable n to represent the position of a number in the sequence, write an expression that allows you to calculate the nth number. The 200th number in the sequence is 599. Verify that your expression works by evaluating it with n equal to 200.		2014-07-10 02:45:29.344025	2014-07-10 02:45:29.344025	a) 17,20,23\r\nb) 299\r\nc) (n*3) - 1\r\n   200*3 = 600 -1 = 599
48	9	5	A group of ten persons were planning to contribute equal amounts of money to buy some pizza. After the pizza was ordered, one person left. Each of the other nine persons had to pay 60 cents extra as a result. How much was the total bill?		2014-07-10 02:45:55.479244	2014-07-10 03:18:26.849142	10th share equals 9 * .60 or $5.40\r\nSo $54.00 for 10 shares.
49	1	6	In the balance diagram below, find the number of marbles that balance one cube.\r\n\r\ncccmmmmmmm    ccccc  mmm\r\n----------   -----------\r\n     |-----------|\r\n           ^		2014-07-10 03:19:20.255455	2014-07-10 03:22:17.914294	 3c + 7m = 5c + 3m\r\n-3c + 3m   3c + 3m\r\n      4m = 2c\r\n      2m = 1c
50	2	6	For each of the following, find the value of x that makes the equation true. The usual way of wording this instruction is solve for x :\r\n(a) 2x = 12 (b) −3x = 12 (c) ax = b		2014-07-10 03:23:40.007996	2014-07-10 03:23:40.007996	a) x = 6\r\nb) x = -4\r\nc) x = b/a
51	3	6	On each of the following number lines, all of the labeled points are evenly spaced. Find coordinates for the seven points designated by the letters.\r\n\r\n---|----|----|----|----|----|----\r\n   3    a    b    c    d`  23    \r\n\r\n---|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----\r\n                  p   8/3   q    6    r		2014-07-10 03:24:25.028365	2014-07-10 03:31:13.875265	---|----|----|----|----|----|----\r\n   3    7   11   15   19`  23    \r\n\r\n---|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----\r\n                  p   8/3   q    6    r\r\n                  1       13/3 18/3 23/3
28	3	3	You are already familiar with operations involving positive numbers, but much mathematical work deals with negative numbers. Common uses include temperatures, money, and games. It is important to understand how these numbers behave in arithmetic calculations. First, consider addition and subtraction. For each of the following, show how the answer can be visualized using a number-line diagram:\r\n(a) The air temperature at 2 pm was 12◦. What was the air temperature at 8 pm, if it had dropped 15◦ by then?\r\n(b) Telescope Peak in the Panamint Mountain Range, which borders Death Valley, is 11045 feet above sea level. At its lowest point, Death Valley is 282 feet below sea level. What is the vertical distance from the bottom of Death Valley to the top of Telescope Peak?\r\n(c) In a recent game, I had a score of 3. I then proceeded to lose 5 points and 7 points on my next two turns. On the turn after that, however, I gained 8 points. What was my score at this moment in the game?		2014-07-08 15:52:34.262475	2014-07-08 16:29:50.008523	a) -----|-----|--.--|-----|-----|-----|-----|-----|-----|-----.-----\r\n       -6    -4    -2     0     2`    3     6     8    10    12\r\n                8 p.m.                                      2 p.m.\r\n\r\nb) ----|----|----|---,|----|----|----|----|----|--,-|----\r\n      -3k  -2k  -1k   0   2k   4k   6k   8k   10k  12k\r\n\r\nc) ----|----3----|----|----|----|----|----|----2----4----|----|----|----1----|----|----|----  Final score: -1\r\n      -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0    1`   2    3    4    5    6
29	4	3	To buy a ticket for a weekly state lottery, a person selects 6 integers from 1 to 36, the order not being important. There are 1947792 such combinations of six digits. Alex and nine friends want to win the lottery by buying every possible ticket (all 1947792 combinations), and plan to spend 16 hours a day doing it. Assume that each person buys one ticket every five seconds. What do you think of this plan? Can the project be completed within a week?		2014-07-08 16:34:13.133959	2014-07-08 16:34:13.133959	10 tickets every 5 seconds.\r\n120 tickets per minute. (times 12)\r\n7200 tickets per hour.  (times 60)\r\n115200 tickets per day. (times 16 hour day)\r\n806400 tickets per week.(times 7 days in a week)\r\n\r\nStupid plan.\r\n\r\n
30	5	3	Locate the following numbers relative to each other on a number line:\r\n(a) 3.03 (b) 3.303 (c) 3.033 (d) 3.333 (e) 3.33		2014-07-08 16:44:33.708883	2014-07-08 16:57:24.013229	----|--.------|---------|---------.--.------|---------|---------|---------|---------|---------|---------|----\r\n   3.00      3.01      3.02      3.03      3.04      3.05      3.06      3.07      3.08      3.09      3.10\r\n                               3.03  3.033                       \r\n----|--.------|---------|---------.--.------|---------|---------|---------|---------|---------|---------|----\r\n   3.30      3.31      3.32      3.33      3.34      3.35      3.36      3.37      3.38      3.39      3.4\r\n     3.303                     3.33 3.333
31	6	3	The area of the surface of a sphere is described by the formula S = 4r^2, where r is the radius of the sphere. The Earth has a radius of 3960 miles and dry land forms approximately 29.2% of the Earth’s surface. What is the area of the dry land on Earth?\r\nWhat is the surface area of the Earth’s water?		2014-07-08 17:05:04.231663	2014-07-08 17:05:04.231663	4*3.14*3960^2 =196,960,896 sq. for the earth\r\n\r\n 57,512,582 sq. ni. of land\r\n\r\n139,448,314 s1. mi. of water
32	7	3	Mark a random number x between 1 and 2 (at a spot that only you will think of) on a number line. Plot the opposite of each of the following:\r\n(a) x (b) x + 5 (c) x − 4 (d) 6 − x\r\n		2014-07-08 17:06:35.294021	2014-07-08 17:10:15.506411	---|----|----|----|----|----|----|----|-c--|--a-|----|----|-x--|----|----|--d-|-b--|----\r\n  -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0    1`   2    3    4    5    6
33	1	4	At 186282 miles per second, how far does light travel in a year? Give your answer in miles, but use scientific notation, which expresses a number like 93400000 as 9:34 × 10^7 (which might appear on your calculator as 9.34 E7 instead). A year is approximately 365.25 days. The answer to this question is called a light year by astronomers, who use it to measure huge distances. Other than the Sun, the star nearest the Earth is Proxima Centauri, a mere 4.2 light years away.	Approximation due to length of year being inexact	2014-07-08 22:17:25.898376	2014-07-08 22:17:36.68604	186282 * 60 * 50 *24 *365.25 = 5,878,612,843,200\r\n\r\n5.878612843200E12
35	3	4	Later you have another chocolate bar. This time, after you give away 1/3 of the bar,a friend breaks off 3/4 of the remaining piece. What part of the original chocolate bar do you have left? Answer this question by drawing a diagram.		2014-07-08 22:23:34.841057	2014-07-08 22:23:34.841057	Have   Give\r\nxx        x       2/3\r\nxxxx     xx       4/6\r\nx     xxxxx       1/6
34	2	4	Before you are able to take a bite of your new chocolate bar, a friend comes along and takes 1/4 of the bar. Then another friend comes along and you give this person 1/3 of what you have left. Make a diagram that shows the part of the bar left for you to eat.		2014-07-08 22:19:12.938515	2014-07-08 22:23:57.203635	xxx    x\r\nxx     x\r\nHalf
36	4	4	Profits for the Whirligig Sports Equipment Company for six fiscal years, from 1993 through 1998, are graphed at right. The vertical scale is in millions of dollars. Describe the change in profit from\r\n(a) 1993 to 1994;\r\n(b) 1994 to 1995;\r\n(c) 1997 to 1998.\r\nDuring these six years, did the company make an overall profit or sustain an overall loss? What was the net change?		2014-07-09 04:19:49.81674	2014-07-09 04:22:43.62854	a) down 1.1%\r\nb) down 3.2%\r\nc) done 1.7%\r\n2.6+1.5-1.7+1.8-0.6-2.3 = net profit of 1.3 million\r\n\r\n
37	5	4	The temperature outside is dropping at 3 degrees per hour. Given that the temperature at noon was 0◦, what was the temperature at 1 pm? at 2 pm? at 3 pm? at 6 pm? What was the temperature t hours after noon?		2014-07-09 04:24:20.582525	2014-07-09 04:24:20.582525	-3\r\n-6\r\n-9\r\n-18\r\n-3t
38	6	4	This year, there are 1016 students at the Academy, of whom 63 live in Dunbar Hall.\r\nTo the nearest tenth of a percent, what part of the student population lives in Dunbar?	Rounding	2014-07-09 04:26:03.794781	2014-07-09 04:26:03.794781	0.06200%\r\nto the nearest tenth, then, 0.1%
39	7	4	Let k represent some unknown number between −4 and −5. Locate between two consecutive integers each of the following:\r\n(a) −k (b) −k + 5 (c) k/2+ 2 (d) (k + 2)/2\r\n		2014-07-09 04:31:51.383867	2014-07-09 04:31:51.383867	a) 4 and 5\r\nb) 9 and 14\r\nc) 0 and -1\r\nd) -1 and -2
41	2	5	(Continuation) Using c to stand for the weight of one cube and m for the weight of one marble, write an equation that models the picture in the previous problem. Use this equation to find how many marbles it takes to balance one cube.		2014-07-09 04:40:48.754147	2014-07-09 04:40:48.754147	 3c + 7m  =   5c + m\r\n-(3c + m) = -(3c + m)\r\n    6m/2  =   2c/2\r\n      3m  =    c
42	3	5	The division problem 12÷(3/4) is equivalent to the multiplication problem 12·(4/3) . Explain. Write each of the following division problems as equivalent multiplication problems:\r\n(a) 20 ÷ 5 \r\n(b) 20 ÷ 1/5\r\n(c) 20 ÷ 2/5\r\n(d) a ÷ b/c\r\n(e) b/c ÷ a		2014-07-10 01:01:21.912461	2014-07-10 01:59:17.494071	To eliminate the fractional denominator one must change it to 1. This can be done for any fraction by multiplying by the reciprocal. To not change the overall value the  multiplying the numerator also must be multiplied by the same value.\r\na) 20 * 1/5\r\nb) 20 * 5\r\nc) 20 * 5/2\r\nd) a * c/b\r\ne) b/c * 1/a or b/(a*c)
52	5	6	A rectangle whose length is x and whose width is 1 is called an x-block. The figure shows two of them. ------      -----\r\n(a) What is the area of an x-block?                                                                    |    | 1    |   |\r\n(b) What is the combined area of two x-blocks?                                                         ------     X|   |\r\n(c) Show that there are two different ways to combine two x-blocks                                        X        |   |\r\nto form a rectangle whose area is 2x.                                                                              -----\r\n(d) Draw two different rectangular diagrams to show that x + 2x = 3x.                                                1		2014-07-10 03:37:24.575664	2014-07-10 03:39:32.123779	a) x\r\nb) 2x\r\nc)||  or --\r\nd) ||| or ---\r\n
60	2	7	Make a dot somewhere between 0 and 0.5 on a number line, and label it k. Place each of the following on the same number line as accurately as you can.\r\n(a) −k (b) 2k (c) k^2 (d) k − 2 (e)√k		2014-07-10 05:17:32.335743	2014-07-10 05:21:54.466137	---|----|----|----|----|----|----|----|----|c---|---a|.b--|----|----|----|----|----|----\r\n  -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0 e  1`   2    3    4    5    6\r\n                                                     ck
61	3	7	Simplify each of the following:\r\n(a) the sum of 6x + 2 and −8x + 5;\r\n(b) the result of subtracting 5x − 17 from 8x + 12;\r\n(c) the product of 7x and 4x − 9.		2014-07-10 05:23:36.826162	2014-07-10 05:23:36.826162	a) -2x + 7\r\nb) 3x - 5\r\nc) 28x^2 - 63x
53	4	6	Using the four integers 1, 2, 3 and 4 once each — in any order — and three arithmetic operations selected from among addition, subtraction, multiplication, and division, is it possible to write an expression whose value is 1? Using the same numbers and conditions, how many of the integers from 1 to 10 can you form? You will need to use parentheses		2014-07-10 03:38:54.303938	2014-07-10 04:28:55.323714	(2*3)-(1+4) = 1\r\n((2*3)/1)-4 = 2\r\n(2*3)+1-4   = 3\r\n(4*2)-(3+1) = 4\r\n(2*4)-(3/1) = 5\r\n(2*4)+1 -3  = 6\r\n((3*4)/2)+1 = 7\r\n(4/2)*(3+1) = 8\r\n(4*3)-(2+1) = 9\r\n(4*3)-(2/1) = 10
54	6	6	Use the distributive property to explain why 3x + 2x can be simplified to 5x.		2014-07-10 04:00:45.240794	2014-07-10 04:30:05.69924	3x + 2x = x(3+2) = 5x
55	7	6	(Continuation) Write each of the following as a product of x and another quantity:\r\n(a) 16x + 7x (b) 12x − 6x (c) ax + bx (d) px − qx\r\n		2014-07-10 04:31:32.769783	2014-07-10 04:31:32.769783	a) 23x\r\nb) 6x\r\nc) x(a+b)\r\nd) x(p-q)
56	8	6	Solve each of the following equations for x:\r\n(a) 16x + 7x = 46 (b) 12x − 6x = 3 (c) ax + bx = 10 (d) px − qx = r		2014-07-10 04:32:05.451275	2014-07-10 04:34:43.426952	a) x = 2\r\nb) x = 1/2\r\nc) x(a+b) = 10, x = 10/(a+b)\r\nd) x(p-q) = r, x = r/(p-q)
57	9	6	Draw a balance diagram that is modeled by the equation c+m+c+7m+c = 2c+2m+3c.\r\nHow many marbles will one cube balance?		2014-07-10 04:35:16.016325	2014-07-10 05:05:01.046902	cmcmmmmmmmc    cc mm ccc\r\n-----------   -----------\r\n     |-----------|\r\n\r\n           ^\r\n 3c + 8m = 5c + 2m\r\n 3c + 2m   3c + 2m\r\n      6m = 2c\r\n      3m = c
58	10	6	You have seen that multiplication distributes over addition. Does multiplication distribute over subtraction? Does multiplication distribute over multiplication? Does multiplication distribute over division? Use examples to illustrate your answers.		2014-07-10 04:35:43.783022	2014-07-10 05:11:38.468246	2(4-3) = 8-6, a(b-c)  = ab-ac, yes\r\n2(4*3)!= 8*6, a(b*c) != ab*ac, no\r\n2(4/3)!= 8/6, a(b/c) != ab/c, no
59	1	7	In baseball statistics, a player’s slugging ratio is defined to be (s + 2d + 3t + 4h)/b, where s is the number of singles, d the number of doubles, t the number of triples and h the number of home runs obtained in b times at bat. Dana came to bat 75 times during the season, and hit 12 singles, 4 doubles, 2 triples, and 8 home runs. What is Dana’s slugging ratio, rounded to three decimal places?		2014-07-10 05:16:32.379842	2014-07-10 05:16:32.379842	((12+(2*4)+(3*2)+(4*8))/75\r\n(12+8+6+32)/75\r\n58/75\r\n.773
62	4	7	Solve 2/3 (3x + 14) = 7x+6, by first multiplying both sides of the equation by 3, before applying the distributive property.		2014-07-10 05:30:18.71841	2014-07-10 05:30:18.71841	2(3x + 14) = 21x + 18\r\n 6x + 28 = 21x + 18\r\n-6x - 18  -6x  - 18\r\n 10 = 15x\r\n  x = 10/15\r\n  x = 2/3\r\n\r\nCheck:\r\n2/3 ( 3*2/3 + 14) = 7*(2/3) + 6\r\n2/3(16) = 14/3 + 18/3\r\n32/3 = 32/3
63	5	7	Because 12x^2 + 5x^2 is equivalent to 17x^2, the expressions 12x^2 and 5x^2 are called like\r\nterms. Explain. Why are 12x^2 and 5x called unlike terms? Are 3ab and 11ab like terms?\r\nExplain. Are 12x^2 and 5y^2 like terms? Explain. Are 12x^2 and 12x like terms? Explain		2014-07-10 18:29:38.251724	2014-07-10 18:29:38.251724	Like terms have the save variable raised to the same power, in effect they represent the same value.\r\n12x^2 and 5x are unlike because the variable in the first term is x*x, while in the second it is only x.\r\n2ab and 11ab are like terms, since in both cases the variables are the same, so the value would be the same.\r\n12x^2 and 5y^2 aren't like terms since x and y don't have to have the same value.\r\n12x^2 and 12x aren't like terms since in the first case the value is x*x and the second only x. These two values would only be the same if x was 1 or 0.
64	6	7	In each of the following, use appropriate algebraic operations to remove the parentheses and combine like terms. Leave your answers in a simple form.\r\n(a) x(2x) + 2(x + 5) (b) 2x(5x − 2) + 3(6x + 7) (c) 5m(3m − 2n) + 4n(3m − 2n)		2014-07-10 18:34:18.355488	2014-07-10 18:34:18.355488	a) 2x^2 + 2x +10\r\nb) 10x^2 - 4x + 18x + 21 -> 10x^2 + 14x + 21\r\nc) 15m^2 - 10mn + 12mn - 8n^2 -> 15m^2 + 2mn - 8n^2\r\n
65	7	7	True or false, with justification: 7/12 + 11/12 + 1/12 + 19/12 is equivalent to 1/12(7+11+1+19).\r\n		2014-07-10 18:38:34.181781	2014-07-10 18:38:34.181781	True, if 1/12 is distributed over the 4 values the first statement results.\r\nOr, in both cases the value is 38/12, first by sum of fractions, second by taking 1/12 of 38.
66	8	7	Jess has just finished telling Lee about learning a wonderful new algebra trick: 3+5x can be simplified very neatly to just 8x, because a + bx is the same as (a + b)x. Now Lee has to break some bad news to Jess. What is it?		2014-07-10 18:40:00.840733	2014-07-10 18:40:00.840733	(a + b)x when distributed comes out to ax + bx, not a + bx.
67	9	7	Find whole numbers m and n that fit the equation 3m + 6n = 87. Is it possible to find whole numbers m and n that fit the equation 3m + 6n = 95? If so, find an example. If not, explain why not.		2014-07-10 18:54:56.124471	2014-07-10 18:54:56.124471	3m + 6n = 87\r\n3*11 + 6*9 = 87\r\n3*9 + 6*10 = 87\r\n3*7 + 6*11 = 87\r\n3*5 + 6*12 = 87\r\n\r\nCan't make 95 as any number times 3 subtracted from 87 will leave a number not divisible by 6, i.e. 92,89,86,83,80,77,74, 71,68,65,62,59,56m etc, the even result is always 1 less than a number divisible by 6.
68	10	7	If m and n stand for integers, then 2m and 2n stand for even integers. Explain. Use the distributive property to show that the sum of any two even numbers is even.		2014-07-10 18:56:00.096193	2014-07-10 18:56:00.096193	2m + 2n = 2(m + n). Any number times two is even.
69	11	7	(Continuation) Show that the sum of any two odd numbers is even.		2014-07-10 18:59:30.976228	2014-07-10 18:59:30.976228	m and n are even.\r\nTherefore m+1 and n+1 are odd.\r\nm + 1 + n + 1 = m + n + 2\r\nThe sum of two even numbers + 2 is also even as it is the sum of 3 even numbers.
70	12	7	Solve 9x + 2 = 3/4(2x + 11).		2014-07-10 19:08:07.829311	2014-07-10 19:08:07.829311	9x + 2 = 3/4(2x + 11)\r\n36x + 8 = 3(2x + 11)\r\n36x + 8 = 6x + 33\r\n-6x      -6x\r\n30x + 8 = 33\r\n    - 8   -8\r\n30x = 25\r\nx = 25/30\r\nx = 5/6\r\n\r\ncheck:\r\n9(5/6) + 2 = 3/4(2(5/6) + 11)\r\n45/6 + 12/6 = 3/4(10/6 + 66/6)\r\n57/6 = 3/4(76/6)\r\n57/6 = 228/24\r\n57/6 = 57/6
71	1	8	The distributive property states that (−1)x + 1x is the same as (−1 + 1)x, and this is 0. It follows that (−1)x is the same as −x. Explain why, then use similar reasoning to explain why (−x)y is the same as −(xy). By the way, is it correct to say, “−x is a negative number”?		2014-07-10 19:15:29.213407	2014-07-10 19:15:29.213407	Since x + (-x)  = 0, -x must be the same as (-1)x.\r\n(-x)y = (-1)xy = -xy\r\nIt is not correct to refer to -x as the value of x might be negative, in which case -x would be positive.
72	2	8	Simplify the expression k −2(k −(2−k))−2 by writing it without using parentheses.		2014-07-10 19:19:39.567314	2014-07-10 19:19:39.567314	k −2(k −(2−k))−2\r\nk -2(k -2 +k) -2\r\nk -2(2k - 2) - 2\r\nk -4k + 4 -2\r\n-3k + 2
73	3	8	Last year the price of an iPod was $240.\r\n(a) This year the price increased to $260. By what percent did the price increase?\r\n(b) If the price next year were 5% more than this year’s price, what would that price be?\r\n(c) If the price dropped 5% the year after that, show that the price would not return to\r\n$260. Explain the apparent paradox.		2014-07-10 19:30:40.506845	2014-07-10 19:30:40.506845	a) $260/240 = 1.08333, 8.3%\r\nb) $260*1.05 = 273$\r\nc) $273*.95 = $259.35\r\nYou are taking 5% off of a larger value on the decrease, so the amount the price goes down is greater.
74	4	8	During a recent episode of Who Wants to Be a Billionaire, your friend Terry called you, needing help with solving the equation 5x+1 = 2x+7. Write down the step-by-step instructions you would give Terry over the phone.		2014-07-10 19:36:23.939994	2014-07-10 19:36:23.939994	 5x+1 = 2x+7  1) subtract 2x from both sides\r\n-2x     2x    2) this puts all the x's on the left side\r\n 3x+1 = 7     3) now subtract 1 from both sides\r\n   -1  -1     4) this puts all the numbers on the right side\r\n 3x = 6       5) now divide both sides by 3 to get a single x on the left\r\n  x = 6/3     6) simplify 6/3 to 2\r\n  x = 2       7) q.e.d\r\n\r\nCheck:\r\n5x+1 = 2x+7\r\n10+1 = 4+7\r\n11 = 11
75	5	8	Which number is closer to zero, −4/5 or 5/4?		2014-07-10 19:37:43.093038	2014-07-10 19:37:43.093038	-4/5 is only .8 away from zero while 5/4 is 1.25 away from zero.
76	6	8	Several Preps were meeting in a room. After 45 of them left, the room was 5/8 as full as it was initially. How many Preps were in the room at the start of the meeting?		2014-07-10 19:40:24.623644	2014-07-10 19:40:24.623644	3/8x = 45\r\nx = 45*8/3\r\nx = 8 * 15\r\nx = 120\r\n
77	7	8	The figure shows some more algebra blocks. The 1-by-1 square is called a unit block, or a 1-block. Below the 1-block is a representation of x + 2, formed from an x-block and two 1-blocks. Draw a diagram using the appropriate number of x-blocks and 1-blocks to illustrate the distributive propertry 3(x + 2) = 3x + 6.\r\n\r\n  XXX\r\n1 X X\r\n  XXX\r\n\r\n  XXXXXXXXXXXXXXXX\r\n1 X          | | X\r\n  XXXXXXXXXXXXXXXX\r\n        x     1 1		2014-07-10 22:09:32.729486	2014-07-10 22:09:32.729486	\r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n1 X         | | XX         | | X X         | | X  \r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n       x+2            x+2            x+2          3(x + 2)\r\n\r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n1 X         XX         X X         | | | | | | X  \r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n       x          x           x     1 1 1 1 1 1   3x + 6\r\n \r\n
78	8	8	Often it is necessary to rearrange an equation so that one variable is expressed in terms of others. For example, the equation D = 3t expresses D in terms of t. To express t in terms of D, divide both sides of this equation by 3 to obtain D/3 = t.\r\n(a) Solve the equation C = 2r for r in terms of C.\r\n(b) Solve the equation p = 2w + 2h for w in terms of p and h.\r\n(c) Solve the equation 3x − 2y = 6 for y in terms of x.		2014-07-10 22:15:41.388913	2014-07-10 22:15:41.388913	a) C = 2r. r = C/2\r\nb) p = 2w + 2h. w = (p - 2h)/2\r\nc) 3x − 2y = 6, 3x = 2y + 6, x = (2y + 6)/3\r\n
79	9	8	On a number line, what number is halfway between (a) −4 and 11? (b) m and n?	Assuming m in less than n	2014-07-10 22:18:50.361319	2014-07-10 22:18:50.361319	a) 3.5\r\nb) m + (m-n)/2
80	10	8	Coffee beans lose 12.5% of their weight during roasting. In order to obtain 252 kg of roasted coffee beans, how many kg of unroasted beans must be used?		2014-07-10 22:21:20.821921	2014-07-10 22:21:20.821921	0.875x = 252\r\n\r\nx = 288
81	11	8	The product of two negative numbers is always a positive number. How would you explain this rule to a classmate who does not understand why the product of two negative numbers must be positive?		2014-07-10 22:34:06.996566	2014-07-10 22:34:06.996566	1 - (-1) = 2  Multiplication can be thought of as successive addition, i.e. 3*2 = 2+2+2\r\nSo -3 * -2 is like -(-2-2-2). We combine 3 -2s, but since we're combining them not 3, but -3 times, we multiply the final result by -1 because -3 = (-1)*3.
82	1	9	Temperature is measured in both Celsius and Fahrenheit degrees. These two systems are of course related: the Fahrenheit temperature is obtained by adding 32 to 9/5 of the Celsius temperature. In the following questions, let C represent the Celsius temperature and F the Fahrenheit temperature.\r\n(a) Write an equation that expresses F in terms of C.\r\n(b) Use this equation to find the value of F that corresponds to C = 20.\r\n(c) On the Celsius scale, water freezes at 0◦ and boils at 100◦. Use your formula to find\r\nthe corresponding temperatures on the Fahrenheit scale. Do you recognize your answers?\r\n(d) A quick way to get an approximate Fahrenheit temperature from a Celsius temperature\r\nis to double the Celsius temperature and add 30. Explain why this is a good approximation.\r\nConvert 23◦ Celsius the quick way. What is the difference between your answer and the\r\ncorrect value? For what Celsius temperature does the quick way give the correct value?		2014-07-10 22:45:03.906362	2014-07-10 22:45:03.906362	a) F = (9/5)C + 32\r\nb) F = (9/5)20 + 32\r\n   F = 68\r\nc) F = (9/5)0 + 32, F = 32, freezing\r\n   F = (9/5)100 + 32, F= 180+32, F = 212, boiling\r\nd) Since 9/5 is a little less than doubling, we add a little less than 32.\r\n   76 F\r\n   (9/5)23 + 32, 73.4\r\n   \r\n   (9/5)x +32 = 2x + 30\r\n9x + 160 = 10x + 150\r\n       x = 10\r\n\r\ncheck:\r\n(9/5)10+32 = 50\r\n2*10 + 30  = 50\r\n\r\n\r\nF = (
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('questions_id_seq', 82, true);


--
-- Data for Name: questions_topics; Type: TABLE DATA; Schema: public; Owner: action
--

COPY questions_topics (question_id, topic_id) FROM stdin;
1	1
1	2
2	1
2	2
3	3
1	4
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: action
--

COPY schema_migrations (version) FROM stdin;
20140210193621
20140210194914
20140211141945
20140705055628
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: action
--

COPY topics (id, "topicName", comments, created_at, updated_at) FROM stdin;
1	Algebraic Representation	Very important	2014-02-14 23:00:25.509033	2014-02-14 23:00:25.509033
2	Graphing		2014-02-20 17:10:37.16577	2014-02-20 17:10:37.16577
3	Linear Algebra		2014-02-20 17:27:26.180291	2014-02-20 17:27:26.180291
4	Distance, Rate, Time		2014-07-07 05:52:57.378728	2014-07-07 05:52:57.378728
5	None		2014-07-07 05:55:04.856829	2014-07-07 05:55:04.856829
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('topics_id_seq', 5, true);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: action; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: action
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM action;
GRANT ALL ON SCHEMA public TO action;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

