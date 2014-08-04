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
    answer text,
    qimage character varying(255),
    aimage character varying(255)
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
-- Name: users; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false,
    teacher boolean DEFAULT false,
    viewer boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO action;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO action;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: action
--

COPY questions (id, num, page, qtext, notes, created_at, updated_at, answer, qimage, aimage) FROM stdin;
14	10	1	Wes bought some school supplies at an outlet store in Maine, a state that has a 6.5% sales tax. Including the sales tax, how much did Wes pay for two blazers priced at $49.95 each and 3 pairs of pants priced at $17.50 each?		2014-07-07 06:29:17.415032	2014-07-07 06:29:17.415032	((2 * 49.95) + ( 3 * 17.50)) * 1.065 = 162.31	\N	\N
15	11	1	(Continuation) A familiar feature of arithmetic is that multiplication distributes over addition. Written in algebraic code, this property looks like a(b+c) = ab+ac. Because of this property, there are two equivalent methods that can be used to compute the answer in the previous problem. Explain, using words and complete sentences.		2014-07-07 06:31:19.432972	2014-07-07 06:31:19.432972	You can either find the price of each individual item and figure the tax, or you can find the pre-tax total and then figure the tax. It ends up the same due to the distributive property.	\N	\N
16	2	2	Pick any number. Add 4 to it and then double your answer. Now subtract 6 from that result and divide your new answer by 2. Write down your answer. Repeat these steps with another number. Continue with a few more numbers, comparing your final answer with your original number. Is there a pattern to your answers?		2014-07-07 14:57:52.426665	2014-07-07 14:57:52.426665	1 -> 2\r\n2 -> 3\r\n100 -> 101\r\n\r\n(2(x+4)-6)/2\r\n(2x+2)/2\r\nx+1	\N	\N
17	3	2	Using the four integers 2, 3, 6 and 8 once each — in any order — and three arithmetic operations selected from among addition, subtraction, multiplication, and division, write expressions whose values are the target numbers given below. You will probably need to use parentheses. For example, to hit the target 90, you could write 90 = (3 + 6) · (8 + 2). \r\n\r\n(a) 3 (b) 24 (c) 36 (d) 30	Trial and error/Pattern building\r\nSee what other numbers can be made from pairs, triplets	2014-07-07 15:12:05.863401	2014-07-07 15:12:05.863401	(a)  2+3+6-8 = 3\r\n(b) (3*6)-2+8 = 24\r\n(c) (2*6*9)/3 = 36\r\n(d) ((2*8)-6)*3 = 30	\N	\N
18	4	2	When describing the growth of a population, the passage of time is sometimes described in generations, a generation being about 30 years. One generation ago, you had two ancestors (your parents). Two generations ago, you had four ancestors (your grandparents). Ninety years ago, you had eight ancestors (your great-grandparents). How many ancestors did you have 300 years ago? 900 years ago? Do your answers make sense?	Powers of two	2014-07-08 03:41:23.04528	2014-07-08 03:41:23.04528	g1 - 2    -  30 years\r\ng2 - 4    -  60 years\r\ng3 - 8    -  90 years\r\ng4 - 16   - 120 years\r\ng5 - 32   - 150 years\r\ng6 - 64   - 180 years\r\ng7 - 128  - 210 years\r\ng8 - 256  - 240 years\r\ng9 - 512  - 270 years\r\ng10- 1,024- 300 years = 2^10\r\ng30-        900 years = 2^30 = 1,073,741,824\r\n\r\nIt doesn't make sense as there probably weren't even 1 billion humans alive 900 years ago; the number is probably much lower due to common ancestors.\r\n	\N	\N
3	1	2	Woolworth’s had a going-out-of-business sale. The price of a telephone before the sale was $39.98. What was the price of the telephone after a 30% discount? If the sale price of the same telephone had been $23.99, what would the (percentage) discount have been?	Percentage review	2014-02-14 17:14:06.59592	2014-07-05 06:08:14.346362	39.99 * .7,\r\n\r\n(39.99-23.99)/39.99	\N	\N
1	1	1	Light travels at about 186 thousand miles per second, and the Sun is about 93 million miles from the Earth. How much time does light take to reach the Earth from the Sun?		2014-02-14 17:13:05.764503	2014-07-05 06:14:52.00225	93,000,000/186,000 = # of seconds it takes = 500\r\n500/60 = 8 minutes 20 seconds	\N	\N
2	2	1	How long would it take you to count to one billion, reciting the numbers one after another? First write a guess into your notebook, then come up with a thoughtful answer. One approach is to actually do it and have someone time you, but there are more manageable alternatives. What assumptions did you make in your calculations?	Easy to make mistakes when dealing with very large numbers.	2014-02-14 17:13:41.019212	2014-07-05 06:21:24.866224	It's going to take a long time, since almost all of the numbers are greater than 1 million and it takes several seconds just to say one very large number. If the average number takes about 5 seconds, it would take around 5 billion seconds. 5,000,000,000/(60*60*24*365) gives an estimate of about 158 years.	\N	\N
7	3	1	It takes 1.25 seconds for light to travel from the Moon to the Earth. How many miles away is the Moon?	The orbit is elliptical, not round, so this is at best an approximation, or more strictly speaking the distance from the earth to the moon isn't a constant value.	2014-07-07 05:52:27.924879	2014-07-07 05:52:27.924879	186000*1.25=232,500 miles	\N	\N
8	4	1	Many major-league baseball pitchers can throw the ball at 90 miles per hour. At that \r\nspeed, how long does it take a pitch to travel from the pitcher’s mound to home plate, a distance of 60 feet 6 inches? Give your answer to the nearest hundredth of a second. There are 5280 feet in a mile.	What's the difference in time for a 79mph curveball?	2014-07-07 06:01:42.069819	2014-07-07 06:02:08.124077	90mph*5280 = 475,200fph/60  = 7920fpm/60 = 132 fps\r\n132/60.5 = 2.18 seconds\r\n	\N	\N
9	5	1	You have perhaps heard the saying, “A journey of 1000 miles begins with a single step.” How many steps would you take to finish a journey of 1000 miles? What information do you need in order to answer this question? Find a reasonable answer. What would your answer be if the journey were 1000 kilometers?	Again, values are under the control of the stepper.	2014-07-07 06:06:28.481688	2014-07-07 06:06:28.481688	How long is a step? Estimate 2.5 feet per step.\r\n5280/2.5 = 2,112 steps per mile, or 2,112,000 for a thousand miles.\r\nI km = ~.625 miles, so ~1,320,000 steps for 1,000 km. 	\N	\N
10	6	1	In an offshore pipeline, a cylindrical mechanism called a “pig” is run through the pipes periodically to clean them. These pigs travel at 2 feet per second. What is this speed, expressed in miles per hour?		2014-07-07 06:15:33.530602	2014-07-07 06:15:33.530602	2 fps = 2 * 60 * 60 or 7200 fph.\r\n7200/5280 = 1.3636 mph.	\N	\N
11	7	1	Your class sponsors a benefit concert and prices the tickets at $8 each. Dale sells 12 tickets, Andy 16, Morgan 17, and Pat 13. Compute the total revenue brought in by these four persons. Notice that there are two ways to do the calculation.		2014-07-07 06:19:03.256325	2014-07-07 06:19:03.256325	(12+15+17+13) * 8 or\r\n12*8 + 16*8 + 17*8 + 13*8\r\n$464	\N	\N
12	8	1	Kelly telephoned Brook about a homework problem. Kelly said, “Four plus three times two is 14, isn’t it?” Brook replied, “No, it’s 10.” Did someone make a mistake? Can you explain where these two answers came from?		2014-07-07 06:21:54.709149	2014-07-07 06:21:54.709149	Depends on order of operations, without parentheses it isn't clear if it is (4+3)*2 or 4+(3*2), though the latter could be argued to be correct under strict PEMDAS interpretation.	\N	\N
19	5	2	On a recent episode of Who Wants to Be a Billionaire, a contestant was asked to\r\narrange the following five numbers in increasing order. You try it, too.\r\n(a) 2/3 (b) 0.6666 (c) 3/5 (d) 0.666 (e) 0.67		2014-07-08 03:45:23.715799	2014-07-08 03:45:23.715799	a = 0.66667  (approximation)\r\nb = 0.66660\r\nc = 0.60000\r\nd = 0.66600\r\ne = 0.67000\r\n\r\nc, d, b, a, e	\N	\N
254	4	28	Write an equation for the line that goes through the point (1,5) and that has slope 2/3.	Point slope form review	2014-07-27 04:17:14.125272	2014-07-27 04:17:14.125272	(y - 5) = 2/3(x - 1)	\N	\N
13	9	1	It is customary in algebra to omit multiplication symbols whenever possible. For example, 11x means the same thing as 11 · x. Which of the following can be condensed by leaving out a multiplication symbol? (a) 4 · 1/3  (b) 1.08 · p (c) 24 · 52 (d) 5 · (2 + x)\r\n	a would look like 4.33\r\nc would look like 2452	2014-07-07 06:26:23.749204	2014-07-07 15:44:01.833295	b - 1.08p\r\nd - 5(2+x)\r\n	\N	\N
20	6	2	The area of a circle whose radius is r is given by the expression r2. Find the area of each of the following circles to the nearest tenth of a square unit of measure:\r\n(a) a circle whose radius is 15 cm (b) a circle whose radius is 0.3 miles	How many decimals of pi to use?	2014-07-08 03:49:45.821713	2014-07-08 03:49:45.821713	a. 707.5 cm^2 or 706.8 with more accurate pi\r\nb. 0.3 mi^2	\N	\N
21	7	2	Choose any number. Double it. Subtract six and add the original number. Now divide by three. Repeat this process with other numbers, until a pattern develops. By using a variable such as x in place of your number, show that the pattern does not depend on which number you choose initially.		2014-07-08 03:54:11.084972	2014-07-08 03:54:11.084972	5*2 = 10\r\n10 - 6 = 4\r\n4 + 5 = 9\r\n9/3 = 3\r\n\r\n(2x - 6 + x )/3 -> (3x - 6)/3 -> x - 2	\N	\N
22	8	2	Explain why there are two ways to compute each of the following:\r\n(a) 3(2 + 3 + 5) \r\n(b) 1/3*(9 + 6 − 3) \r\n(c) (9 + 6 − 3) ÷ 3\r\n		2014-07-08 03:56:59.589915	2014-07-08 03:56:59.589915	Either distribute across the terms, or find the value within the parentheses and then apply the outside term.	\N	\N
23	9	2	Given the information w = 4 inches and h = 7 inches, find two ways to evaluate 2w + 2h. What is the geometric significance of this calculation?		2014-07-08 03:59:35.277779	2014-07-08 03:59:35.277779	(2*4)+(2*7) or 2(4+7)\r\nPerimeter, assuming w is width and h height of a rectangle.	\N	\N
24	10	2	Simplify x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2.		2014-07-08 04:00:25.307589	2014-07-08 04:00:25.307589	9x + 18	\N	\N
25	11	2	Without resorting to decimals, find equivalences among the following nine expressions:\r\n(2·3)/5    (3/5)·2    3·(2/5)   (2/5)(3/3)   (5/3)2   2÷(5/3)  2/5  (5/3)÷(1/2)  3/(5/2)		2014-07-08 04:10:00.062833	2014-07-08 04:10:00.062833	18/15   18/15   18/15   6/15    50/15    18/15    6/15    50/15    18/15	\N	\N
26	1	3	What is the value of 3 + (−3)? What is the value of (−10.4) + 10.4? These pairs of numbers are called opposites. What is the sum of a number and its opposite? Does every number have an opposite? State the opposite of:\r\n(a) −2.341 (b) 1/3 (c) x (d) x + 2 (e) x − 2		2014-07-08 15:41:41.391709	2014-07-08 15:41:41.391709	Sums are 0\r\n0 has no opposite, except perhaps 0\r\n2.34   -1/3     -x     -(x+2)   -(x-2)	\N	\N
27	2	3	As shown on the number line below, k represents an unknown number between 2 and\r\n3. Plot each of the following, extending the line if necessary:\r\n(a) k + 3 (b) k − 2 (c) −k (d) 6 − k\r\n\r\n----|----|----|----|----|----|--.-|----|----|----|----\r\n   -3   -2   -1    0    1`   2  k 3    4    5    6		2014-07-08 15:46:57.729952	2014-07-08 15:49:49.520129	----|-.--|----|----|--.-|----|--.-|-.--|----|--.-|----\r\n   -3   -2   -1    0    1`   2  k 3    4    5    6	\N	\N
43	4	5	What is the value of 2/3· 3/2? \r\nWhat is the value of 4 · 1/4? \r\nThese pairs of numbers are called reciprocals. What is the product of a number and its reciprocal? Does every number have a reciprocal? State the reciprocal of the following:\r\n(a) 5/3\r\n(b) −1/2\r\n(c) 2000 \r\n(d) a/b\r\n(e) 1.2 \r\n(f) x		2014-07-10 02:02:48.403589	2014-07-10 02:03:53.359232	1,1 \r\n0 doesn't have a reciprocal as division by zero is undefined\r\na) 3/5\r\nb) -2\r\nc) 1/2000\r\nd) b/a\r\ne) 1/1.2\r\nf) 1/x	\N	\N
44	5	5	Here is another number puzzle: Pick a number, add 5 and multiply the result by 4. Add another 5 and multiply the result by 4 again. Subtract 100 from your result and divide your answer by 8. How does your answer compare to the original number? You may need to do a couple of examples like this until you see the pattern. Use a variable for the chosen number and show how the pattern holds for any number.		2014-07-10 02:06:39.062544	2014-07-10 02:06:39.062544	5,10,40,45,180,80,10\r\nTwice the original number\r\nx, x+5, 4x + 20, 4x + 25, 16x + 100, 16x, 2x	\N	\N
45	6	5	(Continuation) Make up a number puzzle of your own. Be able to verify the pattern using a variable for the number chosen initially.		2014-07-10 02:10:30.265872	2014-07-10 02:10:30.265872	Pick a number. Double it. Add 10. Double it again. Subtract 20. Divide by 2.\r\n\r\nx, 2x, 2x + 10, 4x + 20, 4x, 2x\r\n\r\n2, 4, 14, 28, 8, 4	\N	\N
46	7	5	Jess takes a board that is 50 inches long and cuts it into two pieces, one of which is 16 inches longer than the other. How long is each piece?		2014-07-10 02:11:09.144842	2014-07-10 02:42:59.402709	33 and 17 inches.\r\nOne is 8 more than 25 and the other 8 less.	\N	\N
47	8	5	Consider the sequence of numbers 2; 5; 8; 11; 14; : : : , in which each number is three more than its predecessor.\r\n(a) Find the next three numbers in the sequence.\r\n(b) Find the 100th number in the sequence.\r\n(c) Using the variable n to represent the position of a number in the sequence, write an expression that allows you to calculate the nth number. The 200th number in the sequence is 599. Verify that your expression works by evaluating it with n equal to 200.		2014-07-10 02:45:29.344025	2014-07-10 02:45:29.344025	a) 17,20,23\r\nb) 299\r\nc) (n*3) - 1\r\n   200*3 = 600 -1 = 599	\N	\N
48	9	5	A group of ten persons were planning to contribute equal amounts of money to buy some pizza. After the pizza was ordered, one person left. Each of the other nine persons had to pay 60 cents extra as a result. How much was the total bill?		2014-07-10 02:45:55.479244	2014-07-10 03:18:26.849142	10th share equals 9 * .60 or $5.40\r\nSo $54.00 for 10 shares.	\N	\N
49	1	6	In the balance diagram below, find the number of marbles that balance one cube.\r\n\r\ncccmmmmmmm    ccccc  mmm\r\n----------   -----------\r\n     |-----------|\r\n           ^		2014-07-10 03:19:20.255455	2014-07-10 03:22:17.914294	 3c + 7m = 5c + 3m\r\n-3c + 3m   3c + 3m\r\n      4m = 2c\r\n      2m = 1c	\N	\N
50	2	6	For each of the following, find the value of x that makes the equation true. The usual way of wording this instruction is solve for x :\r\n(a) 2x = 12 (b) −3x = 12 (c) ax = b		2014-07-10 03:23:40.007996	2014-07-10 03:23:40.007996	a) x = 6\r\nb) x = -4\r\nc) x = b/a	\N	\N
51	3	6	On each of the following number lines, all of the labeled points are evenly spaced. Find coordinates for the seven points designated by the letters.\r\n\r\n---|----|----|----|----|----|----\r\n   3    a    b    c    d`  23    \r\n\r\n---|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----\r\n                  p   8/3   q    6    r		2014-07-10 03:24:25.028365	2014-07-10 03:31:13.875265	---|----|----|----|----|----|----\r\n   3    7   11   15   19`  23    \r\n\r\n---|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----\r\n                  p   8/3   q    6    r\r\n                  1       13/3 18/3 23/3	\N	\N
40	1	5	Use the balance diagram below to find how many marbles it takes to balance one cube.\r\n\r\ncccmmmmmmm    ccccc  m\r\n----------   -----------\r\n     |-----------|\r\n           ^		2014-07-09 04:37:30.095672	2014-07-24 16:28:59.687685	3 cubes and 7 marbles balance 5 cubes and 1 marble\r\nIt would still balance if you took away 3 cubes from each side.\r\nThen there would be 7 marbles on the left and 2 cubes and 1 marble on the right\r\nTake away 1 marble from each side, still balances\r\n6 marbles on the left, 2 cubes on the right\r\nThus 3 marbles weighs the same as 1 cube.	PBL_Graph_5_1.PNG	\N
28	3	3	You are already familiar with operations involving positive numbers, but much mathematical work deals with negative numbers. Common uses include temperatures, money, and games. It is important to understand how these numbers behave in arithmetic calculations. First, consider addition and subtraction. For each of the following, show how the answer can be visualized using a number-line diagram:\r\n(a) The air temperature at 2 pm was 12◦. What was the air temperature at 8 pm, if it had dropped 15◦ by then?\r\n(b) Telescope Peak in the Panamint Mountain Range, which borders Death Valley, is 11045 feet above sea level. At its lowest point, Death Valley is 282 feet below sea level. What is the vertical distance from the bottom of Death Valley to the top of Telescope Peak?\r\n(c) In a recent game, I had a score of 3. I then proceeded to lose 5 points and 7 points on my next two turns. On the turn after that, however, I gained 8 points. What was my score at this moment in the game?		2014-07-08 15:52:34.262475	2014-07-08 16:29:50.008523	a) -----|-----|--.--|-----|-----|-----|-----|-----|-----|-----.-----\r\n       -6    -4    -2     0     2`    3     6     8    10    12\r\n                8 p.m.                                      2 p.m.\r\n\r\nb) ----|----|----|---,|----|----|----|----|----|--,-|----\r\n      -3k  -2k  -1k   0   2k   4k   6k   8k   10k  12k\r\n\r\nc) ----|----3----|----|----|----|----|----|----2----4----|----|----|----1----|----|----|----  Final score: -1\r\n      -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0    1`   2    3    4    5    6	\N	\N
29	4	3	To buy a ticket for a weekly state lottery, a person selects 6 integers from 1 to 36, the order not being important. There are 1947792 such combinations of six digits. Alex and nine friends want to win the lottery by buying every possible ticket (all 1947792 combinations), and plan to spend 16 hours a day doing it. Assume that each person buys one ticket every five seconds. What do you think of this plan? Can the project be completed within a week?		2014-07-08 16:34:13.133959	2014-07-08 16:34:13.133959	10 tickets every 5 seconds.\r\n120 tickets per minute. (times 12)\r\n7200 tickets per hour.  (times 60)\r\n115200 tickets per day. (times 16 hour day)\r\n806400 tickets per week.(times 7 days in a week)\r\n\r\nStupid plan.\r\n\r\n	\N	\N
30	5	3	Locate the following numbers relative to each other on a number line:\r\n(a) 3.03 (b) 3.303 (c) 3.033 (d) 3.333 (e) 3.33		2014-07-08 16:44:33.708883	2014-07-08 16:57:24.013229	----|--.------|---------|---------.--.------|---------|---------|---------|---------|---------|---------|----\r\n   3.00      3.01      3.02      3.03      3.04      3.05      3.06      3.07      3.08      3.09      3.10\r\n                               3.03  3.033                       \r\n----|--.------|---------|---------.--.------|---------|---------|---------|---------|---------|---------|----\r\n   3.30      3.31      3.32      3.33      3.34      3.35      3.36      3.37      3.38      3.39      3.4\r\n     3.303                     3.33 3.333	\N	\N
31	6	3	The area of the surface of a sphere is described by the formula S = 4r^2, where r is the radius of the sphere. The Earth has a radius of 3960 miles and dry land forms approximately 29.2% of the Earth’s surface. What is the area of the dry land on Earth?\r\nWhat is the surface area of the Earth’s water?		2014-07-08 17:05:04.231663	2014-07-08 17:05:04.231663	4*3.14*3960^2 =196,960,896 sq. for the earth\r\n\r\n 57,512,582 sq. ni. of land\r\n\r\n139,448,314 s1. mi. of water	\N	\N
32	7	3	Mark a random number x between 1 and 2 (at a spot that only you will think of) on a number line. Plot the opposite of each of the following:\r\n(a) x (b) x + 5 (c) x − 4 (d) 6 − x\r\n		2014-07-08 17:06:35.294021	2014-07-08 17:10:15.506411	---|----|----|----|----|----|----|----|-c--|--a-|----|----|-x--|----|----|--d-|-b--|----\r\n  -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0    1`   2    3    4    5    6	\N	\N
33	1	4	At 186282 miles per second, how far does light travel in a year? Give your answer in miles, but use scientific notation, which expresses a number like 93400000 as 9:34 × 10^7 (which might appear on your calculator as 9.34 E7 instead). A year is approximately 365.25 days. The answer to this question is called a light year by astronomers, who use it to measure huge distances. Other than the Sun, the star nearest the Earth is Proxima Centauri, a mere 4.2 light years away.	Approximation due to length of year being inexact	2014-07-08 22:17:25.898376	2014-07-08 22:17:36.68604	186282 * 60 * 50 *24 *365.25 = 5,878,612,843,200\r\n\r\n5.878612843200E12	\N	\N
35	3	4	Later you have another chocolate bar. This time, after you give away 1/3 of the bar,a friend breaks off 3/4 of the remaining piece. What part of the original chocolate bar do you have left? Answer this question by drawing a diagram.		2014-07-08 22:23:34.841057	2014-07-08 22:23:34.841057	Have   Give\r\nxx        x       2/3\r\nxxxx     xx       4/6\r\nx     xxxxx       1/6	\N	\N
34	2	4	Before you are able to take a bite of your new chocolate bar, a friend comes along and takes 1/4 of the bar. Then another friend comes along and you give this person 1/3 of what you have left. Make a diagram that shows the part of the bar left for you to eat.		2014-07-08 22:19:12.938515	2014-07-08 22:23:57.203635	xxx    x\r\nxx     x\r\nHalf	\N	\N
37	5	4	The temperature outside is dropping at 3 degrees per hour. Given that the temperature at noon was 0◦, what was the temperature at 1 pm? at 2 pm? at 3 pm? at 6 pm? What was the temperature t hours after noon?		2014-07-09 04:24:20.582525	2014-07-09 04:24:20.582525	-3\r\n-6\r\n-9\r\n-18\r\n-3t	\N	\N
38	6	4	This year, there are 1016 students at the Academy, of whom 63 live in Dunbar Hall.\r\nTo the nearest tenth of a percent, what part of the student population lives in Dunbar?	Rounding	2014-07-09 04:26:03.794781	2014-07-09 04:26:03.794781	0.06200%\r\nto the nearest tenth, then, 0.1%	\N	\N
39	7	4	Let k represent some unknown number between −4 and −5. Locate between two consecutive integers each of the following:\r\n(a) −k (b) −k + 5 (c) k/2+ 2 (d) (k + 2)/2\r\n		2014-07-09 04:31:51.383867	2014-07-09 04:31:51.383867	a) 4 and 5\r\nb) 9 and 14\r\nc) 0 and -1\r\nd) -1 and -2	\N	\N
41	2	5	(Continuation) Using c to stand for the weight of one cube and m for the weight of one marble, write an equation that models the picture in the previous problem. Use this equation to find how many marbles it takes to balance one cube.		2014-07-09 04:40:48.754147	2014-07-09 04:40:48.754147	 3c + 7m  =   5c + m\r\n-(3c + m) = -(3c + m)\r\n    6m/2  =   2c/2\r\n      3m  =    c	\N	\N
42	3	5	The division problem 12÷(3/4) is equivalent to the multiplication problem 12·(4/3) . Explain. Write each of the following division problems as equivalent multiplication problems:\r\n(a) 20 ÷ 5 \r\n(b) 20 ÷ 1/5\r\n(c) 20 ÷ 2/5\r\n(d) a ÷ b/c\r\n(e) b/c ÷ a		2014-07-10 01:01:21.912461	2014-07-10 01:59:17.494071	To eliminate the fractional denominator one must change it to 1. This can be done for any fraction by multiplying by the reciprocal. To not change the overall value the  multiplying the numerator also must be multiplied by the same value.\r\na) 20 * 1/5\r\nb) 20 * 5\r\nc) 20 * 5/2\r\nd) a * c/b\r\ne) b/c * 1/a or b/(a*c)	\N	\N
52	5	6	A rectangle whose length is x and whose width is 1 is called an x-block. The figure shows two of them. ------      -----\r\n(a) What is the area of an x-block?                                                                    |    | 1    |   |\r\n(b) What is the combined area of two x-blocks?                                                         ------     X|   |\r\n(c) Show that there are two different ways to combine two x-blocks                                        X        |   |\r\nto form a rectangle whose area is 2x.                                                                              -----\r\n(d) Draw two different rectangular diagrams to show that x + 2x = 3x.                                                1		2014-07-10 03:37:24.575664	2014-07-10 03:39:32.123779	a) x\r\nb) 2x\r\nc)||  or --\r\nd) ||| or ---\r\n	\N	\N
60	2	7	Make a dot somewhere between 0 and 0.5 on a number line, and label it k. Place each of the following on the same number line as accurately as you can.\r\n(a) −k (b) 2k (c) k^2 (d) k − 2 (e)√k		2014-07-10 05:17:32.335743	2014-07-10 05:21:54.466137	---|----|----|----|----|----|----|----|----|c---|---a|.b--|----|----|----|----|----|----\r\n  -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0 e  1`   2    3    4    5    6\r\n                                                     ck	\N	\N
61	3	7	Simplify each of the following:\r\n(a) the sum of 6x + 2 and −8x + 5;\r\n(b) the result of subtracting 5x − 17 from 8x + 12;\r\n(c) the product of 7x and 4x − 9.		2014-07-10 05:23:36.826162	2014-07-10 05:23:36.826162	a) -2x + 7\r\nb) 3x - 5\r\nc) 28x^2 - 63x	\N	\N
53	4	6	Using the four integers 1, 2, 3 and 4 once each — in any order — and three arithmetic operations selected from among addition, subtraction, multiplication, and division, is it possible to write an expression whose value is 1? Using the same numbers and conditions, how many of the integers from 1 to 10 can you form? You will need to use parentheses		2014-07-10 03:38:54.303938	2014-07-10 04:28:55.323714	(2*3)-(1+4) = 1\r\n((2*3)/1)-4 = 2\r\n(2*3)+1-4   = 3\r\n(4*2)-(3+1) = 4\r\n(2*4)-(3/1) = 5\r\n(2*4)+1 -3  = 6\r\n((3*4)/2)+1 = 7\r\n(4/2)*(3+1) = 8\r\n(4*3)-(2+1) = 9\r\n(4*3)-(2/1) = 10	\N	\N
54	6	6	Use the distributive property to explain why 3x + 2x can be simplified to 5x.		2014-07-10 04:00:45.240794	2014-07-10 04:30:05.69924	3x + 2x = x(3+2) = 5x	\N	\N
55	7	6	(Continuation) Write each of the following as a product of x and another quantity:\r\n(a) 16x + 7x (b) 12x − 6x (c) ax + bx (d) px − qx\r\n		2014-07-10 04:31:32.769783	2014-07-10 04:31:32.769783	a) 23x\r\nb) 6x\r\nc) x(a+b)\r\nd) x(p-q)	\N	\N
56	8	6	Solve each of the following equations for x:\r\n(a) 16x + 7x = 46 (b) 12x − 6x = 3 (c) ax + bx = 10 (d) px − qx = r		2014-07-10 04:32:05.451275	2014-07-10 04:34:43.426952	a) x = 2\r\nb) x = 1/2\r\nc) x(a+b) = 10, x = 10/(a+b)\r\nd) x(p-q) = r, x = r/(p-q)	\N	\N
57	9	6	Draw a balance diagram that is modeled by the equation c+m+c+7m+c = 2c+2m+3c.\r\nHow many marbles will one cube balance?		2014-07-10 04:35:16.016325	2014-07-10 05:05:01.046902	cmcmmmmmmmc    cc mm ccc\r\n-----------   -----------\r\n     |-----------|\r\n\r\n           ^\r\n 3c + 8m = 5c + 2m\r\n 3c + 2m   3c + 2m\r\n      6m = 2c\r\n      3m = c	\N	\N
58	10	6	You have seen that multiplication distributes over addition. Does multiplication distribute over subtraction? Does multiplication distribute over multiplication? Does multiplication distribute over division? Use examples to illustrate your answers.		2014-07-10 04:35:43.783022	2014-07-10 05:11:38.468246	2(4-3) = 8-6, a(b-c)  = ab-ac, yes\r\n2(4*3)!= 8*6, a(b*c) != ab*ac, no\r\n2(4/3)!= 8/6, a(b/c) != ab/c, no	\N	\N
59	1	7	In baseball statistics, a player’s slugging ratio is defined to be (s + 2d + 3t + 4h)/b, where s is the number of singles, d the number of doubles, t the number of triples and h the number of home runs obtained in b times at bat. Dana came to bat 75 times during the season, and hit 12 singles, 4 doubles, 2 triples, and 8 home runs. What is Dana’s slugging ratio, rounded to three decimal places?		2014-07-10 05:16:32.379842	2014-07-10 05:16:32.379842	((12+(2*4)+(3*2)+(4*8))/75\r\n(12+8+6+32)/75\r\n58/75\r\n.773	\N	\N
62	4	7	Solve 2/3 (3x + 14) = 7x+6, by first multiplying both sides of the equation by 3, before applying the distributive property.		2014-07-10 05:30:18.71841	2014-07-10 05:30:18.71841	2(3x + 14) = 21x + 18\r\n 6x + 28 = 21x + 18\r\n-6x - 18  -6x  - 18\r\n 10 = 15x\r\n  x = 10/15\r\n  x = 2/3\r\n\r\nCheck:\r\n2/3 ( 3*2/3 + 14) = 7*(2/3) + 6\r\n2/3(16) = 14/3 + 18/3\r\n32/3 = 32/3	\N	\N
63	5	7	Because 12x^2 + 5x^2 is equivalent to 17x^2, the expressions 12x^2 and 5x^2 are called like\r\nterms. Explain. Why are 12x^2 and 5x called unlike terms? Are 3ab and 11ab like terms?\r\nExplain. Are 12x^2 and 5y^2 like terms? Explain. Are 12x^2 and 12x like terms? Explain		2014-07-10 18:29:38.251724	2014-07-10 18:29:38.251724	Like terms have the save variable raised to the same power, in effect they represent the same value.\r\n12x^2 and 5x are unlike because the variable in the first term is x*x, while in the second it is only x.\r\n2ab and 11ab are like terms, since in both cases the variables are the same, so the value would be the same.\r\n12x^2 and 5y^2 aren't like terms since x and y don't have to have the same value.\r\n12x^2 and 12x aren't like terms since in the first case the value is x*x and the second only x. These two values would only be the same if x was 1 or 0.	\N	\N
64	6	7	In each of the following, use appropriate algebraic operations to remove the parentheses and combine like terms. Leave your answers in a simple form.\r\n(a) x(2x) + 2(x + 5) (b) 2x(5x − 2) + 3(6x + 7) (c) 5m(3m − 2n) + 4n(3m − 2n)		2014-07-10 18:34:18.355488	2014-07-10 18:34:18.355488	a) 2x^2 + 2x +10\r\nb) 10x^2 - 4x + 18x + 21 -> 10x^2 + 14x + 21\r\nc) 15m^2 - 10mn + 12mn - 8n^2 -> 15m^2 + 2mn - 8n^2\r\n	\N	\N
65	7	7	True or false, with justification: 7/12 + 11/12 + 1/12 + 19/12 is equivalent to 1/12(7+11+1+19).\r\n		2014-07-10 18:38:34.181781	2014-07-10 18:38:34.181781	True, if 1/12 is distributed over the 4 values the first statement results.\r\nOr, in both cases the value is 38/12, first by sum of fractions, second by taking 1/12 of 38.	\N	\N
66	8	7	Jess has just finished telling Lee about learning a wonderful new algebra trick: 3+5x can be simplified very neatly to just 8x, because a + bx is the same as (a + b)x. Now Lee has to break some bad news to Jess. What is it?		2014-07-10 18:40:00.840733	2014-07-10 18:40:00.840733	(a + b)x when distributed comes out to ax + bx, not a + bx.	\N	\N
67	9	7	Find whole numbers m and n that fit the equation 3m + 6n = 87. Is it possible to find whole numbers m and n that fit the equation 3m + 6n = 95? If so, find an example. If not, explain why not.		2014-07-10 18:54:56.124471	2014-07-10 18:54:56.124471	3m + 6n = 87\r\n3*11 + 6*9 = 87\r\n3*9 + 6*10 = 87\r\n3*7 + 6*11 = 87\r\n3*5 + 6*12 = 87\r\n\r\nCan't make 95 as any number times 3 subtracted from 87 will leave a number not divisible by 6, i.e. 92,89,86,83,80,77,74, 71,68,65,62,59,56m etc, the even result is always 1 less than a number divisible by 6.	\N	\N
68	10	7	If m and n stand for integers, then 2m and 2n stand for even integers. Explain. Use the distributive property to show that the sum of any two even numbers is even.		2014-07-10 18:56:00.096193	2014-07-10 18:56:00.096193	2m + 2n = 2(m + n). Any number times two is even.	\N	\N
69	11	7	(Continuation) Show that the sum of any two odd numbers is even.		2014-07-10 18:59:30.976228	2014-07-10 18:59:30.976228	m and n are even.\r\nTherefore m+1 and n+1 are odd.\r\nm + 1 + n + 1 = m + n + 2\r\nThe sum of two even numbers + 2 is also even as it is the sum of 3 even numbers.	\N	\N
70	12	7	Solve 9x + 2 = 3/4(2x + 11).		2014-07-10 19:08:07.829311	2014-07-10 19:08:07.829311	9x + 2 = 3/4(2x + 11)\r\n36x + 8 = 3(2x + 11)\r\n36x + 8 = 6x + 33\r\n-6x      -6x\r\n30x + 8 = 33\r\n    - 8   -8\r\n30x = 25\r\nx = 25/30\r\nx = 5/6\r\n\r\ncheck:\r\n9(5/6) + 2 = 3/4(2(5/6) + 11)\r\n45/6 + 12/6 = 3/4(10/6 + 66/6)\r\n57/6 = 3/4(76/6)\r\n57/6 = 228/24\r\n57/6 = 57/6	\N	\N
71	1	8	The distributive property states that (−1)x + 1x is the same as (−1 + 1)x, and this is 0. It follows that (−1)x is the same as −x. Explain why, then use similar reasoning to explain why (−x)y is the same as −(xy). By the way, is it correct to say, “−x is a negative number”?		2014-07-10 19:15:29.213407	2014-07-10 19:15:29.213407	Since x + (-x)  = 0, -x must be the same as (-1)x.\r\n(-x)y = (-1)xy = -xy\r\nIt is not correct to refer to -x as the value of x might be negative, in which case -x would be positive.	\N	\N
72	2	8	Simplify the expression k −2(k −(2−k))−2 by writing it without using parentheses.		2014-07-10 19:19:39.567314	2014-07-10 19:19:39.567314	k −2(k −(2−k))−2\r\nk -2(k -2 +k) -2\r\nk -2(2k - 2) - 2\r\nk -4k + 4 -2\r\n-3k + 2	\N	\N
73	3	8	Last year the price of an iPod was $240.\r\n(a) This year the price increased to $260. By what percent did the price increase?\r\n(b) If the price next year were 5% more than this year’s price, what would that price be?\r\n(c) If the price dropped 5% the year after that, show that the price would not return to\r\n$260. Explain the apparent paradox.		2014-07-10 19:30:40.506845	2014-07-10 19:30:40.506845	a) $260/240 = 1.08333, 8.3%\r\nb) $260*1.05 = 273$\r\nc) $273*.95 = $259.35\r\nYou are taking 5% off of a larger value on the decrease, so the amount the price goes down is greater.	\N	\N
74	4	8	During a recent episode of Who Wants to Be a Billionaire, your friend Terry called you, needing help with solving the equation 5x+1 = 2x+7. Write down the step-by-step instructions you would give Terry over the phone.		2014-07-10 19:36:23.939994	2014-07-10 19:36:23.939994	 5x+1 = 2x+7  1) subtract 2x from both sides\r\n-2x     2x    2) this puts all the x's on the left side\r\n 3x+1 = 7     3) now subtract 1 from both sides\r\n   -1  -1     4) this puts all the numbers on the right side\r\n 3x = 6       5) now divide both sides by 3 to get a single x on the left\r\n  x = 6/3     6) simplify 6/3 to 2\r\n  x = 2       7) q.e.d\r\n\r\nCheck:\r\n5x+1 = 2x+7\r\n10+1 = 4+7\r\n11 = 11	\N	\N
75	5	8	Which number is closer to zero, −4/5 or 5/4?		2014-07-10 19:37:43.093038	2014-07-10 19:37:43.093038	-4/5 is only .8 away from zero while 5/4 is 1.25 away from zero.	\N	\N
76	6	8	Several Preps were meeting in a room. After 45 of them left, the room was 5/8 as full as it was initially. How many Preps were in the room at the start of the meeting?		2014-07-10 19:40:24.623644	2014-07-10 19:40:24.623644	3/8x = 45\r\nx = 45*8/3\r\nx = 8 * 15\r\nx = 120\r\n	\N	\N
78	8	8	Often it is necessary to rearrange an equation so that one variable is expressed in terms of others. For example, the equation D = 3t expresses D in terms of t. To express t in terms of D, divide both sides of this equation by 3 to obtain D/3 = t.\r\n(a) Solve the equation C = 2r for r in terms of C.\r\n(b) Solve the equation p = 2w + 2h for w in terms of p and h.\r\n(c) Solve the equation 3x − 2y = 6 for y in terms of x.		2014-07-10 22:15:41.388913	2014-07-10 22:15:41.388913	a) C = 2r. r = C/2\r\nb) p = 2w + 2h. w = (p - 2h)/2\r\nc) 3x − 2y = 6, 3x = 2y + 6, x = (2y + 6)/3\r\n	\N	\N
79	9	8	On a number line, what number is halfway between (a) −4 and 11? (b) m and n?	Assuming m in less than n	2014-07-10 22:18:50.361319	2014-07-10 22:18:50.361319	a) 3.5\r\nb) m + (m-n)/2	\N	\N
80	10	8	Coffee beans lose 12.5% of their weight during roasting. In order to obtain 252 kg of roasted coffee beans, how many kg of unroasted beans must be used?		2014-07-10 22:21:20.821921	2014-07-10 22:21:20.821921	0.875x = 252\r\n\r\nx = 288	\N	\N
81	11	8	The product of two negative numbers is always a positive number. How would you explain this rule to a classmate who does not understand why the product of two negative numbers must be positive?		2014-07-10 22:34:06.996566	2014-07-10 22:34:06.996566	1 - (-1) = 2  Multiplication can be thought of as successive addition, i.e. 3*2 = 2+2+2\r\nSo -3 * -2 is like -(-2-2-2). We combine 3 -2s, but since we're combining them not 3, but -3 times, we multiply the final result by -1 because -3 = (-1)*3.	\N	\N
82	1	9	Temperature is measured in both Celsius and Fahrenheit degrees. These two systems are of course related: the Fahrenheit temperature is obtained by adding 32 to 9/5 of the Celsius temperature. In the following questions, let C represent the Celsius temperature and F the Fahrenheit temperature.\r\n(a) Write an equation that expresses F in terms of C.\r\n(b) Use this equation to find the value of F that corresponds to C = 20.\r\n(c) On the Celsius scale, water freezes at 0◦ and boils at 100◦. Use your formula to find\r\nthe corresponding temperatures on the Fahrenheit scale. Do you recognize your answers?\r\n(d) A quick way to get an approximate Fahrenheit temperature from a Celsius temperature\r\nis to double the Celsius temperature and add 30. Explain why this is a good approximation.\r\nConvert 23◦ Celsius the quick way. What is the difference between your answer and the\r\ncorrect value? For what Celsius temperature does the quick way give the correct value?		2014-07-10 22:45:03.906362	2014-07-10 22:45:03.906362	a) F = (9/5)C + 32\r\nb) F = (9/5)20 + 32\r\n   F = 68\r\nc) F = (9/5)0 + 32, F = 32, freezing\r\n   F = (9/5)100 + 32, F= 180+32, F = 212, boiling\r\nd) Since 9/5 is a little less than doubling, we add a little less than 32.\r\n   76 F\r\n   (9/5)23 + 32, 73.4\r\n   \r\n   (9/5)x +32 = 2x + 30\r\n9x + 160 = 10x + 150\r\n       x = 10\r\n\r\ncheck:\r\n(9/5)10+32 = 50\r\n2*10 + 30  = 50\r\n\r\n\r\nF = (	\N	\N
83	2	9	You measure your stride and find it to be 27 inches. If you were to walk to Newfields, a town 4.5 miles north of Exeter, how many steps would you have to take? Remember that there are 12 inches in a foot, 3 feet in a yard, and 5280 feet in a mile.		2014-07-11 20:57:06.160869	2014-07-11 20:57:06.160869	4.5 * 5280 * 12 = 285,120 inches\r\ndivided by 27 = 10,560 steps\r\n\r\n\r\n	\N	\N
84	3	9	The Millers must make a 70-mile Thanksgiving trip to visit their grandparents. Pat Miller believes in driving at a steady rate of 50 miles per hour.\r\n(a) With Pat in the driver’s seat, how much time will the trip take?\r\n(b) How many miles will the Millers travel in 18 minutes?\r\n(c) Write an expression for the number of miles they will cover in t minutes of driving.\r\n(d) After t minutes of driving, how many miles remain to be covered?		2014-07-11 21:03:40.616673	2014-07-11 21:03:40.616673	a) 70/50 = 1.4 hours or 84 minutes\r\nb) 50/60 * 18 = 15 miles\r\nc) 5/6t\r\nd) 70-5/6t\r\n\r\ncheck:\r\n5/6*84 = 70	\N	\N
97	4	11	Solve for x: (a) 2(x − 1) = 3(x + 2) (b) −4(2x − 2) = 3(x + 1)		2014-07-12 15:00:19.726291	2014-07-12 15:00:19.726291	(a) 2(x − 1) = 3(x + 2)   ->   2x-2 = 3x + 6    ->  -x = 8    ->  x = -8\r\n(b) −4(2x − 2) = 3(x + 1) ->   -8x + 8 = 3x + 3 ->  11x = 5   ->  x = 5/11\r\n\r\nCheck:\r\na) 2(-8 -1) = 3(-8 + 2) ->  -18 = -18\r\nb) -4(10/11 - 2) = 3(5/11 + 1) -> -40/11 + 8 = 15/11 + 3  -> -40/11 + 88/11 =  15/11 + 33/11  ->  48/11 = 48/11	\N	\N
98	5	11	There are three feet in a yard. Find the number of feet in 5 yards. Find the number of yards in 12 feet. Find the number of feet in y yards. Find the number of yards in f feet.		2014-07-12 15:02:20.567175	2014-07-12 15:02:20.567175	5 yards = 15 feet\r\n12 feet = 4 yards\r\ny yards = 3y feet\r\nf feet = f/3 yards	\N	\N
86	5	9	Solve for x: (a) 3x − 4 = 11 (b) −2x + 5 = −1 (c) ax + b = c\r\n		2014-07-11 21:15:05.078364	2014-07-11 21:15:05.078364	(a) 3x − 4 = 11    3x = 15     x = 5\r\n(b) −2x + 5 = −1   -2x = -6    x = 3\r\n(c) ax + b = c     ax = c - b  x = (c - b)/a	\N	\N
85	4	9	The length of a certain rectangle exceeds its width by exactly 8 cm, and the perimeter of the rectangle is 66 cm. What is the width of the rectangle? Although you may be able to solve this problem using a method of your own, try the following approach, which starts by guessing the width of the rectangle. Study the first row of the table below, which is based on a 10-cm guess for the width. Then make your own guess and use it to fill in the next row of the table. If you have not guessed the correct width, use another row of the table and try again.\r\n\r\nguess    length            perimeter       target      check?\r\n10     10 + 8 = 18    2(10) + 2(18) = 56     66          no		2014-07-11 21:10:42.465035	2014-07-11 21:17:11.817254	guess    length            perimeter       target      check?\r\n10     10 + 8 = 18    2(10) + 2(18) = 56     66          no\r\n12     12 + 8 = 20    2(12) + 2(20) = 64     66          no\r\n13     13 + 8 = 21    2(13) + 2(21) = 68     66          no\r\n12.5 12.5 + 8 = 20.5 2(12.5) + 2(20.5) = 66  66          yes\r\nw        w + 8           2w + 2(w+8)\r\n\r\n2w + 2(w+8) = 66\r\n4w + 16 = 66\r\n4w = 50\r\nw = 12.5	\N	\N
87	1	10	Number-line graphs. Observe the following conventions, which may already be familiar:\r\n• To indicate an interval on the number line, thicken that part of the number line.\r\n• To indicate that an endpoint of an interval is included, place a solid dot on the number.\r\n• To indicate that an endpoint is not included, place an open circle on the number. For example, the diagram illustrates those numbers that are greater than −2 and less than or equal to 3.\r\n\r\n----------o===========*--------------\r\n         -2           3\r\n\r\nDraw a number line for each of the following and indicate the numbers described:\r\n(a) All numbers that are exactly two units from 5.\r\n(b) All numbers that are more than two units from 5.\r\n(c) All numbers that are greater than −1 and less than or equal to 7.\r\n(d) All numbers that are less than four units from zero.		2014-07-11 21:26:45.569136	2014-07-11 21:27:33.575239	a.  ---------------*------------*--------------\r\n                   3     5      7\r\n\r\nb.=================o------------o==============\r\n                   3     5      7\r\n\r\nc. -------------o===============*--------------\r\n               -1               7\r\n\r\nd.----------o=================o--------------\r\n           -4        0        4\r\n  	\N	\N
88	2	10	Percent practice: \r\n(a) 25% of 200 is what number? \r\n(b) 200 is 25% of what number?\r\n(c) Express 2/25 as a decimal; as a percent. \r\n(d) Express 24% as a decimal; as a fraction.		2014-07-11 21:29:48.993673	2014-07-11 21:29:48.993673	a) 50\r\nb) 800\r\nc) 0.08, 6%\r\nd) 0.24, 24/100	\N	\N
89	3	10	At West Point, the “plebe” (first year cadet) who brings dessert to the table must divide it into pieces that are exactly the size requested by the cadets at the table. One night, the two seniors assigned to the table requested 1/6 of the pie and 1/5 of the pie, respectively. How much of the pie did that leave for the younger cadets?		2014-07-11 21:32:57.967024	2014-07-11 21:32:57.967024	1/6 + 1/5 = 5/30 + 6/30 = 11/30\r\n\r\n19/30 remain	\N	\N
90	4	10	Ryan earns x dollars every seven days. Write an expression for how much Ryan earns in one day. Ryan’s spouse Lee is paid twice as much as Ryan. Write an expression for how much Lee earns in one day. Write an expression for their combined daily earnings.		2014-07-11 21:35:05.402577	2014-07-11 21:35:05.402577	x/7\r\n2x/7\r\n3x/7	\N	\N
91	5	10	Solve for x: (a) 2(x − 3) = 4 (b) −3(2x + 1) = 5 (c) a(bx + c) = d		2014-07-11 21:41:17.728061	2014-07-11 21:41:17.728061	a) 2x - 6 = 4, 2x = 10, x = 5\r\nb) -6x - 3 = 5, -6x = 8, x = -8/6, x = -4/3\r\nc) abx + ac = d, abx = d - ac, x = (d - ac)/ab	\N	\N
92	6	10	Day student Avery just bought 10 gallons of gasoline, the amount of fuel used for the last 355 miles of driving. Being a curious sort, Avery wondered how much fuel had been used in city driving (which takes one gallon for every 25 miles) and how much had been used in freeway driving (which takes one gallon for each 40 miles). Avery started by guessing 6 gallons for the city driving, then completed the first row of the guess-and-check table below. Notice the failed check. Make your own guess and use it to fill in the next row of the table.\r\n\r\ncity g     freeway g      city mi      freeway mi      total mi       target      check\r\n   6       10 - 6 = 4   6(25) = 150   4(40) = 160   150 + 160 = 310    355         no\r\n\r\nNow write c in the city-gallon column, fill in the remaining entries in terms of c, and\r\nset your expression for the total mileage equal to the target mileage. Solve the resulting\r\nequation.		2014-07-11 22:02:17.528748	2014-07-11 22:02:17.528748	city g     freeway g      city mi      freeway mi      total mi       target      check\r\n   6       10 - 6 = 4   6(25) = 150   4(40) = 160   150 + 160 = 310    355         no\r\n   4       10 - 4 = 6   4(25) = 100   6(40) = 240   100 + 240 = 340    355         no\r\n   3       10 - 4 = 7   3(25) =  75   7(40) = 280    75 + 280 = 355    355         yes\r\n   c       10 - c           25c         40(10-c)     25c + 40(10-c) =  355\r\n\r\n25c + 40(10-c) =  355\r\n25c - 40c + 400 = 355\r\n-15c = 355-400\r\n15c = 45\r\nc = 3	\N	\N
93	7	10	On a number line, graph all numbers that are closer to 5 than they are to 8.		2014-07-11 22:06:26.135954	2014-07-11 22:06:26.135954	=====|=====|=====|=====|=====|=====|=====|==o--|-----|-----|\r\n     0     1     2     3     4     5     6     7     8     9	\N	\N
94	1	11	Remy walked to a friend’s house, m miles away, at an average rate of 4 mph. The m-mile walk home was at only 3 mph, however. Express as a fraction \r\n(a) the time Remy spent walking home;\r\n(b) the total time Remy spent walking.		2014-07-11 22:10:08.418859	2014-07-11 22:10:08.418859	a) m/3\r\nb) m/3 + m/4 -> 7m/12	\N	\N
77	7	8	The figure shows some more algebra blocks. The 1-by-1 square is called a unit block, or a 1-block. Below the 1-block is a representation of x + 2, formed from an x-block and two 1-blocks. Draw a diagram using the appropriate number of x-blocks and 1-blocks to illustrate the distributive propertry 3(x + 2) = 3x + 6.\r\n\r\n  XXX\r\n1 X X\r\n  XXX\r\n\r\n  XXXXXXXXXXXXXXXX\r\n1 X          | | X\r\n  XXXXXXXXXXXXXXXX\r\n        x     1 1		2014-07-10 22:09:32.729486	2014-07-12 05:28:32.839746	  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n1 X         | | XX         | | X X         | | X  \r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n       x+2            x+2            x+2          3(x + 2)\r\n\r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n1 X         XX         X X         | | | | | | X  \r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n       x          x           x     1 1 1 1 1 1   3x + 6\r\n \r\n	\N	\N
95	2	11	The sum of four consecutive integers is 2174. What are the integers?		2014-07-12 14:30:54.340535	2014-07-12 14:30:54.340535	x+x+1+X+2+x+3 = 2174\r\n4x + 6 = 2174\r\n4x = 2168\r\nx = 542\r\n\r\n542,543,544,545	\N	\N
96	3	11	(Continuation) The smallest of four consecutive integers is n. What expression represents the next larger integer? Write an expression for the sum of four consecutive integers, the smallest of which is n. Write an equation that states that the sum of four consecutive integers is s. Solve the equation for n in terms of s. Check that your answer to the previous question satisfies this equation by considering the case s = 2174.		2014-07-12 14:50:03.722575	2014-07-12 14:50:03.722575	4n + 6 = s\r\n\r\n4(542) + 6 = 2174	\N	\N
308	12	32	Graph y = |x−5| and y = |x+3|, then describe in general terms how the graph of y = |x| is transformed to produce the graph of y = |x − h|.		2014-07-29 07:32:35.481988	2014-07-29 07:32:35.481988	The x intercept moves in the opposite direction the given number of units from the origin.	\N	PBL_ans_32_12.PNG
99	6	11	Sam and Cam have a lawn-mowing service. Their first job tomorrow morning is one that usually takes Sam 40 minutes to do alone, or Cam 30 minutes to do alone. This time they are going to team up, Sam starting at one side and Cam at the other side. The problem is to predict how many minutes it will take them to finish the job. What part of the lawn will Sam complete in the first ten minutes? What part of the lawn will Cam complete in the first ten minutes? What part of the lawn will the team complete in ten minutes? Set up a guess-and-check table with columns titled “minutes”, “Sam part”, “Cam part” and “Team part”. What is the target value for the team part? Fill in two rows of the chart by making guesses in the minutes column. Then guess m and complete the solution algebraically.	 	2014-07-12 15:17:31.626605	2014-07-12 15:17:31.626605	Minutes     Sam Part       Cam Part      Team Part     Target    Met?\r\n10          10/40->3/12     10/30->4/12     7/12         1        no\r\n18          18/40=>9/20     18/30->12/20   21/20         1        no\r\nGuess- 17 minutes\r\n\r\nm/40 + m/30 = 1 ->  30m/1200 + 40m/1200 = 1  ->  70m = 1200  ->   7m = 120  ->  m = 120/7  ->   17 1/7      	\N	\N
100	7	11	Write an expression that represents the number that\r\n(a) is 7 more than x; (b) is 7 less than x; (c) is x more than 7;\r\n(d) exceeds x by 7; (e) is x less than 7; (f) exceeds 7 by x.	Exposing students to multiple forms of expression for converting English to algebraic form	2014-07-12 15:20:05.287577	2014-07-12 15:20:05.287577	a) x + 7\r\nb) x - 7\r\nc) 7 + x\r\nd) x + 7\r\ne) 7 - x\r\nf) 7 + x	\N	\N
101	8	11	The x2-block, shown at right, is another member of the algebra-block family. Draw an algebra-block diagram that shows that x(x+2) = x^2+2x.\r\n\r\n   XXXXXXXXX \r\n   X       X\r\n x X       X\r\n   X       X\r\n   XXXXXXXXX\r\n       x		2014-07-12 15:32:13.211311	2014-07-12 15:32:13.211311	  \r\n   XXXXX   XXXXXXXXX         XXXXX   XXXXX  XXXXX \r\n 1 X   X * X   | | X   ->    X   X 1 X   X  X   X \r\n   XXXXX   XXXXXXXXX       x X   X   XXXXX  XXXXX\r\n     x       x  1 1          X   X     x      x \r\n                             XXXXX\r\n                               x	\N	\N
103	10	11	On a number line, graph a number that is twice as far from 5 as it is from 8. How many such numbers are there?	Twice as far can be either right or left on the number line.	2014-07-12 15:41:52.694322	2014-07-12 15:56:32.247213	---|---------|---------|---------|---------|---------|---------|---------|---------*---------|---------|---------|---------*---------|---------|---------|---------\r\n  -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\nn - 5 = 2(n - 8)\r\nn - 5 = 2n - 16\r\n-n - 5 = 2n - 16\r\nn = 11, 7	\N	\N
110	7	12	One of the PEA interscholastic teams has started its season badly, winning 1 game, losing 6, and tying none. The team will play a total of 25 games this season. \r\n(a) What percentage of the seven games played so far have been wins?\r\n(b) Starting with its current record of 1 win and 6 losses, what will the cumulative winning percentage be if the team wins the next 4 games in a row?\r\n(c) Starting with its current record of 1 win and 6 losses, how many games in a row must the team win in order for its cumulative winning percentage to reach at least 60%?\r\n(d) Suppose that the team wins ten of its remaining 18 games. What is its final winning percentage?\r\n(e) How many of the remaining 18 games does the team need to win so that its final winning percentage is at least 60%? Is it possible for the team to have a final winning\r\npercentage of 80%? Explain.		2014-07-12 17:09:34.557035	2014-07-12 17:09:34.557035	a) 14.29%\r\nb) 41.67%\r\nc) (w+1)/w+7 = 6/10 -> w + 1 = (6w+42)/10  -> 10w + 10 = 6w + 42 -> 4w = 32 -> w = 8 , must win at least 8 games. Check- new record 9/15 = .6\r\nd) 44%\r\ne) 14 of the remaining games would give a final winning percentage of 60% ( 15 w, 10 l). The highest percentage they could get would be 76% from the resulting 19 w, 6 l season.	\N	\N
104	1	12	Intervals on a number line are often described using the symbols < (“less than”), > (“greater than”), ≤ (“less than or equal to”), and ≥ (“greater than or equal to”). As you graph the following inequalities, remember the endpoint convention regarding the use of the dot • and the circle ◦ for included and excluded endpoints, respectively:\r\n(a) x < 5 (b) x ≥ −6 (c) −12 ≥ x (d) 4 < x < 8 (e) x < −3 or 7 ≤ x		2014-07-12 15:57:46.745006	2014-07-12 16:08:27.550754	Number Lines:\r\na) ===|=========|=========|=========|=========|=========|=========o---------|---------|---------|---------|---------|---------|---------|---------|---------|---------\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\nb) ---*=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========||=========|=========|=========|========\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\nc) ===|=========|=========|=========*---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------\r\n    -15       -14        -13       -12       -11       -10       -9        -8        -7        -6        -5        -4        -3        -2        -1          \r\n3\r\nd) ---|---------|---------|---------|---------|---------o=========|=========|=========|=========o---------|---------|---------|---------|---------|---------|---------\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\ne) ===|=========|=========|=========|=========o---------|---------|---------|---------*=========|=========|=========|=========|=========|=========|=========|=========\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\n\r\n	\N	\N
105	2	12	Solve the equation A = P + Prt for r. Solve the equation A = P + Prt for P.		2014-07-12 16:11:31.394673	2014-07-12 16:11:31.394673	A = P + Prt\r\nPrt = A - P\r\nr = (A - P)/Pt\r\n\r\nA = P + Prt\r\nA = P(1 + rt)\r\nP = A/(rt + 1)	\N	\N
106	3	12	Using a number line, describe the location of (x + y)/2 in relation to the locations of x and y. Is your answer affected by knowing whether x and y are positive or not?		2014-07-12 16:24:22.925955	2014-07-12 16:24:22.925955	a) ---|---------|---------|---------|----*----|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n                                    x         y                  x+y\r\n\r\nYes, the answer is affected by knowing if x and y are positive or negative since values on the number line are based on the distance from 0 either left or right, and without knowing the sign of the number you can't know which way to go.	\N	\N
107	4	12	Find the smallest positive integer divisible by every positive integer less than or equal to 10.		2014-07-12 16:39:51.747283	2014-07-12 16:39:51.747283	9*8*7*5 = 2,520\r\n\r\n9 makes it also divisible by 3\r\n8 makes it also divisible by 2 and 4\r\n5 times the other 3 makes it also divisible by 10	\N	\N
108	5	12	Evaluate the formula 36y + 12f + i when y = 2,5, f = 2, and i = 5. Find an interpretation for this formula.		2014-07-12 16:48:06.392634	2014-07-12 16:48:06.392634	36y + 12f + i\r\n36*2.5 + 12*2 + 5 = 90 + 24 + 5 = 119\r\n\r\nConvert a distance given in yards, feet, inches to inches.	\N	\N
109	6	12	The indicator on the oil tank in my home indicated that the tank was one-eighth full. After a truck delivered 240 gallons of oil, the indicator showed that the tank was half full. What is the capacity of the oil tank, in gallons?		2014-07-12 16:51:12.263404	2014-07-12 16:51:12.263404	3c/8 = 240\r\n3c =  1920\r\nc = 640 gallons	\N	\N
309	13	32	Write an equation for each of the graphs shown at right. Each graph goes through several lattice points.		2014-07-29 07:34:33.468182	2014-07-29 07:34:33.468182	On the left, y = |x|\r\nOn the right, y = |x - 3|	PBL_graph_32_13.PNG	\N
184	8	21	The diagram shows the last member of the algebra-block family, the y2-block. Show how an xy-block and a y2-block can be combined to illustrate the equation (x + y)y = xy + y2.		2014-07-17 16:15:15.607042	2014-07-17 16:15:15.607042	  XXXXXXXXX\r\n  X   |   X\r\ny X   |   X\r\n  X   |   X\r\n  XXXXXXXXX\r\n    y   x\r\nAcross the bottom we have x + y, and on the vertical we have y. To get the area we multiply the two. So the total area of the two blocks will be y*2 + xy	\N	\N
310	1	33	A horse thief riding at 8 mph has a 32-mile head start. The posse in pursuit is riding at 10 mph. In how many hours will the thief be overtaken? [From The New Arithmetic, Seymour Eaton, 1885]		2014-07-29 07:37:35.208059	2014-07-29 07:37:35.208059	8h + 32 = 10h\r\n2h = 32\r\nh = 16, 16 hours\r\n\r\ncheck:  after 16 hours the thief has traveled (16*8)+32 or 160 miles, which equals 10 * 16.	\N	\N
111	8	12	Graph on a number line the intervals described below:\r\n(a) All numbers that are greater than 1 or less than −3.\r\n(b) All numbers that are greater than −5 and less than or equal to 4.\r\n(c) All numbers whose squares are greater than or equal to 1.		2014-07-12 17:10:01.542999	2014-07-12 17:16:45.12103	a) ===|=========|=========|=========o---------|---------|---------|---------o=========|=========|=========|=========|=========|=========|========\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\nb) ---|---------o=========|=========|=========|=========|=========|=========|=========|=========|=========*---------|---------|---------|---------\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\nc) ---|=========|=========|=========|=========|=========*---------|---------*=========|=========|=========|=========||=========|=========|=========|========\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\n	\N	\N
112	9	12	Use mathematical notation to represent the intervals described below.\r\n(a) All numbers that are greater than 1 or less than −3.\r\n(b) All numbers that are greater than −5 and less than or equal to 4.\r\n(c) All numbers whose squares are greater than or equal to 1.\r\nJuly		2014-07-12 17:19:02.153133	2014-07-12 17:20:58.078678	a) x > 1 or x < -3\r\nb) -5 < x ≤ 4\r\nc) x ≤ -1 or x ≥ 1\r\n\r\n	\N	\N
113	1	13	Randy and Sandy have a total of 20 books between them. After Sandy loses three by leaving them on the bus, and some birthday gifts double Randy’s collection, their total increases to 30 books. How many books did each have before these changes?		2014-07-12 17:27:17.679737	2014-07-12 17:27:17.679737	s-3+2r = 30\r\ns + r  = 20\r\nr - 3 = 10\r\nr = 13, s = 7\r\n\r\nCheck: 13+7 = 20,  13*2+(7-3) = 30\r\n\r\n\r\n\r\n	\N	\N
114	2	13	Combine the following fractions into a single fraction. Express each of your answers in lowest terms.\r\n(a) 27/5 + 3y/4\r\n(b) 4m/5 − 2/3\r\n(c) 2 + x/3\r\n(d) x/2 + 2x/3 − 3x/4		2014-07-12 17:44:16.442258	2014-07-12 17:44:16.442258	a) (108 + 15y)/20\r\nb) (12m-10)/15\r\nc) (x + 6)/3\r\nd) (6x+8x-9x)/12 -> 5x/12	\N	\N
115	3	13	Solve the following for x:\r\n(a) 4 − (x + 3) = 8 − 5(2x − 3) (b) x − 2(3 − x) = 2x + 3(1 − x)		2014-07-12 19:50:20.586958	2014-07-12 19:50:20.586958	a) 4 − (x + 3) = 8 − 5(2x − 3) -> 4 - x - 3 = 8 - 10x + 15  ->  1 - x = -10x + 23  ->  9x = 22   ->  x = 22/9\r\nb) x − 2(3 − x) = 2x + 3(1 − x)  -> x - 6 + x = 2x + 3 - 3x   ->   2x - 6 = -x + 3   ->   3x = 9   ->  x = 3 \r\n\r\nCheck:\r\na) 4 - (22/9 +3) = 8 - 5(44/9 - 3) ->  4 - 22/9 - 3 = 8 - 220/9 + 15 -> 1 - 22/9 = 23 - 220/9 -> 9/9 - 22/9 = 207/9 - 220/9  ->  -13/9 = -13/9\r\nb) 3 - 2(3 - 3) = 2*3 + 3(1 - 3) ->   = 3 - 6 + 3 = 6 + 3 - 9 -> 0 = 0	\N	\N
116	4	13	Guessing birthdays. Pat is working a number trick on Kim, whose birthday is the 29th of February. The table below shows the sequence of questions that Pat asks, as well as the calculations that Kim makes in response. Another column is provided for the algebra you are going to do to solve the trick. Use the letters m and d for month and day.\r\nInstruction                               Kim   Algebra\r\nWrite the number of your birthmonth         2       m\r\nMultiply by 5                              10       \r\nAdd 7                                      17\r\nMultiply by 4                              68\r\nAdd 13                                     81\r\nMultiply by 5                             405\r\nAdd the day of the month of your birthday 434\r\nAfter hearing the result of the last calculation, Pat can do a simple mental calculation and then state Kim’s birthday. Explain how. To test your understanding of this trick, try it on someone whose birthday is unknown to you.		2014-07-12 19:57:52.137595	2014-07-12 19:57:52.137595	Instruction                               Kim   Algebra\r\nWrite the number of your birthmonth         2       m\r\nMultiply by 5                              10      5m  \r\nAdd 7                                      17    5m + 7\r\nMultiply by 4                              68    20m + 28\r\nAdd 13                                     81    20m + 41\r\nMultiply by 5                             405   100m + 205\r\nAdd the day of the month of your birthday 434   100m + 205 + d\r\n\r\nSubtract 2 from the hundreds place to get the number of the month and 5 from the rest to get the day of the month. 	\N	\N
117	5	13	Last year, three fifths of the Outing Club were girls, but this year the number of boys doubled and six new girls joined. There are now as many boys in the club as there are girls. How many members did the club have last year?		2014-07-12 20:20:48.716226	2014-07-12 20:20:48.716226	b = g this year \r\nb/2 = 2/5(3/2b-6)\r\nb/2 = 6/10(b) - 12/5\r\nb = 12/10(b) - 24/5\r\n10b = 12b - 48\r\n2b = 48\r\nb = 24\r\n\r\ncheck: current year, 24b and 24g, last year, 12 boys and 18 girls \r\n\r\n	\N	\N
118	6	13	I am thinking of n consecutive positive integers, the smallest of which is m. What formula represents the largest of these integers?		2014-07-12 20:24:15.418447	2014-07-12 20:24:15.418447	m + n - 1\r\n\r\nCheck: 6 consecutive integers starting with 5 -> 5,6,7,8,9,10 -> 5 + 6 - 1 = 10	\N	\N
119	7	13	Place a common mathematical symbol between the numerals 2 and 3, so as to produce a number that lies between 2 and 3 on a number line.		2014-07-12 20:28:16.632174	2014-07-12 20:28:16.632174	2.3	\N	\N
123	4	14	What is the average daily change of sunset time during the month of September?		2014-07-13 22:05:05.791301	2014-07-24 16:39:43.097443	1.7 minutes per day	PBL_Graph_14_1_6.PNG	\N
126	1	15	A flat, rectangular board is built by gluing together a number of square pieces of the same size. The board is m squares wide and n squares long. Using the letters m and n, write expressions for\r\n(a) the total number of 1 × 1 squares;\r\n(b) the total number of 1 × 1 squares with free edges (the number of 1 × 1 squares that are not completely surrounded by other squares);\r\n(c) the number of completely surrounded 1 × 1 squares;\r\n(d) the perimeter of the figure.		2014-07-13 22:19:03.07922	2014-07-13 22:19:03.07922	a) m*n\r\nb) 2m + 2n - 4\r\nc) (m-2)(n-2)\r\nd) 2m+2n\r\n	\N	\N
121	2	14	On what day does the sun set at 6:54? at 7:08? at 6:30?		2014-07-13 21:54:56.523493	2014-07-24 16:39:06.178011	6:54 = Sept. 15\r\n7:08 = Sept. 5\r\n6:30 = Sept. 28	PBL_Graph_14_1_6.PNG	\N
122	3	14	Guess the time of sunset on the 1st of October and on the 31st of August.		2014-07-13 22:00:51.719918	2014-07-24 16:38:31.573447	Oct. 1 = 6:24\r\nAug. 31 = 7:18	PBL_Graph_14_1_6.PNG	\N
125	6	14	What happens on the Autumnal Equinox, which is the 22nd of September? Guess what time the sun rises on this day.		2014-07-13 22:13:39.564568	2014-07-24 16:42:32.710832	There is an equal amount of night and day. 6:40 a.m.	PBL_Graph_14_1_6.PNG	\N
185	9	21	Which is greater, 73 percent of 87, or 87 percent of 73?		2014-07-17 16:20:53.164409	2014-07-17 16:20:53.164409	87 * .73 = 63.51\r\n73 * .87 = 63.51\r\nNeither is greater, they have to be the same since you are multiplying the same two numbers and you have the equivalent number of decimal places in both multiplications.\r\n	\N	\N
186	10	21	Corey deposits $300 in a bank that pays 4% annual interest. How much interest does Corey earn in one year? What would the interest be if the rate were 6%?		2014-07-17 16:23:15.157661	2014-07-17 16:23:15.157661	300 * .04 = $12 earned in one year.\r\n300 * .06 = #18.\r\n	\N	\N
127	2	15	Graph on a number line the intervals corresponding to these two signs on the highway.\r\n(a) The maximum speed is 65 mph and the minimum speed is 45 mph.\r\n(b) The maximum speed is 55 mph.		2014-07-14 03:48:19.019773	2014-07-14 03:51:48.425601	a) ---|---------|---------|---------|----*====|=========|====*----|---------\r\n     10        20        30        40        50        60        70   \r\n\r\nb) ===|=========|=========|=========|=========|====*----|---------|---------\r\n     10        20        30        40        50        60        70   	\N	\N
129	4	15	It is sometimes necessary to write fractions with variables in the denominator. Without using your calculator, rewrite each of the following as a single fraction. This is called combining over a common denominator.\r\n(a) 3/a + 7/a   (b) 3/a + 7/2a  (c) 3/a + 7/b   (d) 3 + 7/b\r\n		2014-07-14 04:00:49.48266	2014-07-14 04:00:49.48266	a) 10/a     b)  13/2a     c)    (3b + 7a)/ab    d) (3b + 7)/b	\N	\N
131	6	15	Ryan took 25 minutes to type the final draft of a 1200-word English paper. How much time should Ryan expect to spend typing the final draft of a 4000-word History paper?		2014-07-14 04:13:55.980067	2014-07-14 04:13:55.980067	1200/25 = 48 words per minute\r\n\r\n4000/48 = 160 minutes, or 2 hours and 40 minutes\r\n	\N	\N
132	7	15	Which of the following seven expressions does not belong in the list?\r\na − b + c     c − b + a      c − (b − a)     −b + a + c     a − (b − c)     b − (c − a)     a + c − b		2014-07-14 04:17:09.586508	2014-07-14 04:17:09.586508	-b + a + c\r\nNot in easy to read order, i.e. positive number first	\N	\N
133	8	15	Last week, Chris bought a DVD for $10.80 while the store was having a 25%-off sale. The sale is now over. How much would the same DVD cost today?		2014-07-14 04:19:06.66346	2014-07-14 04:19:06.66346	10.80/.75 = 14.40\r\n\r\nCheck = 14.40 * .75 = 10.80	\N	\N
134	9	15	Forrest is texting while driving along the freeway at 70 miles per hour. How many feet does the car travel during the 3-second interval when Forrest’s eyes are not on the road?		2014-07-14 04:22:08.157328	2014-07-14 04:22:08.157328	70 * 5280 = 369,600 feet per hour\r\n369,600/60 - 6,160 feet per minute\r\n6,160/60 = 102.67 feet per second\r\n102.67 * 3 = 308 feet\r\n	\N	\N
135	1	16	The statement “x is between 13 and 23” defines an interval using two simultaneous inequalities: 13 < x and x < 23. The statement “x is not between 13 and 23” also uses two inequalities, but they are non-simultaneous: x ≤ 13 or 23 ≤ x. Graph these two examples on a number line. Notice that there is a compact form 13 < x < 23 for only one of them.	Unclear whether to use o or *, depends on the meaning of between- inclusive or exclusive?	2014-07-14 04:23:19.106744	2014-07-14 04:30:11.39089	a) ---|---------|---------|---------|---------|---------|---------|---------|----o====|=========|=========|=========|=========|====o----|---------|---------|----\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28 \r\n\r\na) ===|=========|=========|=========|=========|=========|=========|=========|====*----|---------|---------|---------|---------|----*====|=========|=========|====\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28  \r\n \r\n 	\N	\N
136	2	16	Crossing a long stretch of the Canadian plains, passenger trains maintain a steady speed of 80 mph. At that speed, what distance is covered in half an hour? How much time is needed to cover 200 miles?\r\nFill in the missing entries in the table below, and plot points on the grid at right.\r\n\r\n         ---------------------------------------------------\r\ntime     | 0  | 1/2|    | 1  | 2  |    | 3  |    | 4  | t  | \r\n         |--------------------------------------------------\r\ndistance |    |    | 60 |    |    | 200|    | 300|    |    |\r\n         ---------------------------------------------------		2014-07-14 14:08:53.624029	2014-07-24 16:44:04.700416	         ---------------------------------------------------\r\ntime     | 0  | 1/2| 3/4| 1  | 2  | 2.5| 3  |3.75| 4  | t  | \r\n         |--------------------------------------------------\r\ndistance | 0  | 40 | 60 | 80 | 160| 200| 240| 300| 320| 80t|\r\n         ---------------------------------------------------	PBL_Graph_16_2_b.PNG	pbl_ans_16_2.PNG
187	11	21	Alex was hired to unpack and clean 576 very small items of glassware, at five cents per piece successfully unpacked. For every item broken during the process, however, Alex had to pay $1.98. At the end of the job, Alex received $22.71. How many items did Alex break?		2014-07-17 16:36:34.748211	2014-07-17 16:36:34.748211	(576 * .05) - (b*1.98+.05) = 22.71\r\n28.80 - (b * 2.03) = 22.71\r\nb * 2.03 = 28.80 - 22.71\r\nb * 2.03 = 6.09\r\nb = 3 items broken\r\n\r\ncheck = 573 * .05 = 28.65 - (3*1.98) = 22.71\r\n\r\n	\N	\N
124	5	14	The dots in the graph form a pattern. Jess thinks that this pattern continues into October, November, and December. What do you think? Make a graph that shows how the time of sunset at Exeter changes during an entire year. A good source for such data is the U.S. Naval Observatory site http://aa.usno.navy.mil.		2014-07-13 22:08:43.303651	2014-07-24 16:41:59.612219	The pattern most likely will continue until late in December, when the day switches from getting shorter to getting longer.	PBL_Graph_14_1_6.PNG	PBL_Ans_14_5.PNG
189	2	22	(Continuation) Plot the data from the tables in the previous question on the same set of axes and use a ruler to draw a line through each set of points. By looking at the graph, how could you recognize the direct variation? What similarities and differences are there between the two lines drawn?		2014-07-17 16:49:20.672517	2014-07-24 16:52:00.98618	Both graphs form straight lines, which indicates direct variation. The lines are parallel, but they cross the x axis at different values.	\N	PBL_Graph_ans_22_2.PNG
128	3	15	Label the figure at right so that it provides a geometric representation of x(x + 3). Notice that this question is about area.		2014-07-14 03:56:48.896917	2014-07-24 16:43:02.944371	  XXXXXXXXXXXXXXXXXXXX\r\n  X            | | | X                     \r\nx X            | | | X\r\n  X            | | | X\r\n  XXXXXXXXXXXXXXXXXXXX\r\n         x      1 1 1	PBL_Graph_15_3.PNG	\N
137	3	16	The problems about the Exeter spring and the Canadian plains contain relationships that are called 'direct variations'. In your own words, describe what it means for one quantity to 'vary directly' with another. Which of the following describe direct variations?\r\n(a) The gallons of water in a tub and the number of minutes since the tap was opened.\r\n(b) The height of a ball and the number of seconds since it was thrown.\r\n(c) The length of a side of a square and the perimeter of the square.\r\n(d) The length of a side of a square and the area of the square.		2014-07-14 14:27:20.766099	2014-07-14 14:30:43.300066	When one value increases the other value increases, the rate of increase remains the same, i.e. for a given amount of increase in the first, the second will increase at whatever the relationship is between them. \r\n\r\na) direct, the amount of water coming out of the tap stays constant\r\nb) not direct, the ball will not go up forever (unless you're in space, in which case which way is up?)\r\nc) direct, doubling the length will double the perimeter, etc.\r\nd) not direct, the area increases faster as the square gets bigger	\N	\N
138	4	16	(Continuation) Sketch graphs for each of the situations described above. Be sure to include meaningful descriptions and scales for each axis.		2014-07-14 14:31:59.898292	2014-07-14 14:31:59.898292		\N	\N
139	5	16	Remy walked to a friend’s house, m miles away, at an average rate of 4 mph. The m-mile walk home was only at 3 mph. Remy spent 2 hours walking in all. Find the value of m.		2014-07-14 14:38:18.304586	2014-07-14 14:38:18.304586	m/4 + m/3 = 2\r\n3m/12 + 4m/12 = 2\r\n7m/12 = 2\r\n7m = 24\r\nm = 24/7\r\nm = 3 3/7\r\n\r\ncheck: (24/7)/4 = 6/7   (24/7)/3 = 8/7   6/7 + 8/7 = 14/7 = 2	\N	\N
140	6	16	The sides of a rectangle in the coordinate plane are parallel to the axes. Two of the vertices of the rectangle are (3;−2) and (−4;−7). Find coordinates for the other two vertices. Find the area of the rectangle.		2014-07-14 14:43:16.523082	2014-07-14 14:43:16.523082	(-4, -2), (3,-7)\r\narea is 35	\N	\N
142	8	16	Tickets to a school play cost $1.50 if bought in advance, and $2.00 if bought at the door. By selling all 200 of their tickets, the players brought in $360. \r\nHow many of the tickets were sold in advance?		2014-07-14 14:58:51.861838	2014-07-14 14:58:51.861838	a = bought in advance, d = bought at door\r\n1.5a + 2d = 360\r\na + d = 200\r\n   2a + 2d = 400\r\n-1.5a + 2d = 360\r\n      0.5a = 40\r\n         a = 80\r\n\r\ncheck = 80 * 1.5 = 120   120*2 = 240     240 + 120 = 360\r\n\r\n	\N	\N
143	1	17	Chandler was given $75 for a birthday present. This present, along with earnings from a summer job, is being set aside for a mountain bike. The job pays $6 per hour, and the bike costs $345. To be able to buy the bike, how many hours does Chandler need to work?		2014-07-14 15:01:38.233644	2014-07-14 15:01:38.233644	6h + 75 = 345\r\n6h = 270\r\nh = 45 hours	\N	\N
144	2	17	(Continuation) Let h be the number of hours that Chandler works. What quantity is represented by the expression 6h? What quantity is represented by the expression 6h+75?\r\n(a) Graph the solutions to the inequality 6h + 75 ≥ 345 on a number line.\r\n(b) Graph the solutions to the inequality 6h + 75 < 345 on a number line.\r\nWhat do the solutions to the inequality 6h + 75 ≥ 345 signify?		2014-07-14 19:29:18.27203	2014-07-14 19:34:16.22987	6h represents how many dollars he makes per hour.\r\n6h + 75 represents how much money he will have in total.\r\na) ---|---------|---------|----*====|=========|====\r\n     20        30        40        50        60       \r\nb) ===|=========|=========|====*----|---------|----\r\n     20        30        40        50        60    \r\nSolutions to a indicate hours greater than or equal to the number of hours he needs to work to get the bike.   	\N	\N
146	4	17	Chase began a number puzzle with the words “Pick a number, add 7 to it, and double the result.”\r\nChase meant to say, “Pick a number, double it, and add 7 to the result.” Are these two instructions equivalent? Explain.		2014-07-14 19:41:54.787966	2014-07-14 19:41:54.787966	Not at all the same. The first is equivalent to 2(x + 7). The second is 2x + 7. These will only be the same if x is 0.	\N	\N
147	5	17	The distance from PEA to the beach at Little Boar’s Head is 10 miles. If you bike from PEA to the beach in 40 minutes, what is your average speed for the trip? What does this mean?		2014-07-14 19:46:26.444494	2014-07-14 19:46:26.444494	10/(40/60) = average speed is 15 miles per hour.\r\nAverage speed means speed as derived from the total time and distance, so faster and slower speeds along the way are 'averaged' into a single speed that takes all of them into account.	\N	\N
148	6	17	(Continuation) On the return trip from the beach, you pedal hard for the first ten minutes and cover 4 miles. Tired, you slow down and cover the last 6 miles in 36 minutes.\r\nWhat is your average speed for the return trip?		2014-07-14 19:49:42.547587	2014-07-14 19:49:42.547587	10/(46/60) = 13.04 miles per hour	\N	\N
149	7	17	Solve the inequality 3 − x > 5 using only the operations of addition and subtraction.\r\nIs x = 0 a solution to the inequality?		2014-07-14 19:53:30.26833	2014-07-14 19:53:30.26833	 3 - x > 5\r\n-3      -3\r\n   -x > 2\r\n    x < -2\r\n\r\n0 is not a solution, as the direction of the inequality needs to be reversed when multiplying by -1.	\N	\N
150	8	17	Alden paid to have some programs printed for the football game last weekend. The printing cost per program was 54 cents, and the plan was to sell them for 75 cents each. Poor weather kept many fans away from the game, however, so unlucky Alden was left with 100 unsold copies, and lost $12 on the venture. How many programs did Alden have printed?	Doesn't come out even, rounding to the nearest dollar.	2014-07-14 20:12:16.444813	2014-07-14 20:12:16.444813	let n be number of programs printed\r\n\r\n54n - ((n-100)*75) = -1200\r\n54n - (75n - 7500) = -1200\r\n    - 21n +7500  = -1200\r\n       21n = 8700\r\n        n = 8700/21\r\n414 programs were printed	\N	\N
151	9	17	The Mount Major hike starts in Alton Bay, 716 feet above sea level. The summit is 1796 feet above sea level, and it takes about 45 minutes for a typical hiker to make the climb. Find the rate at which this hiker gains altitude, in feet per minute.		2014-07-14 20:15:32.335697	2014-07-14 20:15:32.335697	1796-716 = 1,080 feet gained in altitude.\r\n1080/45 = 24 feet per minute	\N	\N
141	7	16	The rectangle shown at right has been broken into four smaller rectangles. The areas of three of the smaller rectangles are shown in the diagram.\r\nFind the area of the fourth one.		2014-07-14 14:52:46.741045	2014-07-24 16:44:30.159803	(312/234) * 270 = 360\r\nor\r\n(270/234) + 312 = 360	PBL_Graph_16_7.PNG	\N
153	2	18	Pat bought several pens at Walgreen’s, for 60 cents each. Spending the same amount of money at the Bookstore, Pat then bought a few more pens that cost 80 cents each. In all, 42 pens were bought. How many pens did Pat buy at the bookstore?		2014-07-15 05:49:19.622293	2014-07-15 05:49:19.622293	 w + b = 42\r\n.6w = .8b\r\n w = (4/3)b\r\n(4/3)b + b = 42\r\n(7/3)b = 42\r\n7b = 126\r\nb = 18, w = 24\r\n\r\ncheck; 18*.8 = 24*.6 -> 14.4 = 14.4\r\n\r\n	\N	\N
156	4	18	The line through (1; 6) and (0; 3) passes through every quadrant except one. Which one?		2014-07-15 06:04:29.129859	2014-07-15 06:06:35.098926	Quadrant IV	\N	\N
157	5	18	Combine over a common denominator without using a calculator:\r\n(a) 1/4 + 1/5\r\n(b) 1/10 + 1/11\r\n(c) 1/x + 1/(x + 1)\r\n\r\nEvaluate your answer to (c) with x = 4 and then with x = 10. How do these answers compare to your answers to (a) and (b)?		2014-07-15 06:12:30.138737	2014-07-15 06:14:51.838593	(a) 1/4 + 1/5 = 5/29 + 4/20 = 9/20\r\n(b) 1/10 + 1/11 = 11/110 + 10/110 = 21/110\r\n(c) 1/x + 1/(x + 1) = (x + 1 + x)/(x^2 + x) = (2x + 1)/(x^2 + x)\r\n\r\nc with 4 = 9/20,  c with 10 = 21/110. The answers are the same:)	\N	\N
158	6	18	A small pool is 20 feet long, 12 feet wide and 4 feet deep. There are 7.5 gallons of water in every cubic foot. At the rate of 5 gallons per minute, how long will it take to fill this pool?		2014-07-15 06:17:44.650449	2014-07-15 06:17:44.650449	20*12*4 = 960 cubic feet in the pool\r\n960*7.5 = 7200 gallons\r\n7200/5 = 1,440 minutes or 24 hours	\N	\N
163	4	19	(Continuation) The slope of a line is a measure of how steep the line is. It is calculated by dividing the change in y-coordinates by the corresponding change in x-coordinates between two points on the line: slope = change in y/change in x. Calculate the slope of the line that goes through the two points (1, 3) and (7. 6). Calculate the slope of the line that goes through the two points (0, 0) and (9, 6). Which line is steeper?		2014-07-16 04:36:26.338313	2014-07-24 16:48:18.251887	First Line = (6/3)/(7-1) = 3/6 = 1/2\r\nSecond Line= 6/9 = 2/3\r\nThe second line is steeper.	\N	PBL_Graph_ans_19_4.PNG
162	3	19	Each step of the stairs leading from room 9 to room 107 in the Academy Building has a vertical rise of 7 inches and a horizontal run of 12 inches. Each step of the marble staircase leading to the Assembly Hall has a vertical rise of 5.5 inches and a horizontal run of 13 inches.\r\n(a) Which flight of stairs do you think is steeper? Why?\r\n(b) Calculate the ratio rise=run for each flight of stairs, and verify that the greater ratio\r\nbelongs to the flight you thought to be steeper.		2014-07-16 04:27:30.263854	2014-07-16 04:27:30.263854	Academy Building 9 to 108 slope is 7/12\r\nAcademy Building marble staircase 5.5/13\r\nMarble staircase is less steep as it rises less in a greater horizontal run.\r\nRatio 1 = .5833\r\nRatio 2 = .4230\r\n	\N	\N
164	5	19	Explain why the descriptions “right 5 up 2”, “right 10 up 4”, “left 5 down 2”, “right 5/2 up 1”, and “left 1 down 2/5” all describe the same inclination for a straight line.		2014-07-16 04:37:41.410752	2014-07-16 04:37:41.410752	Because they all describe the same slope, 5/2.	\N	\N
166	7	19	Solve the following for x: (a) x/2 + x/5 = 6 (b) x/3 + (x + 1)/6 = 4		2014-07-16 05:30:00.867096	2014-07-16 05:30:00.867096	(a) x/2 + x/5 = 6  ->   5x/10 + 2x/10 = 6   ->  7x/10 = 6   ->  7x = 60  ->  x = 60/7\r\n\r\n(b) x/3 + (x + 1)/6 = 4   ->  2x/6 (x+1)/6 = 4   ->  2x + x + 1 = 24  -> 3x +1 = 24  ->  x = 23/3\r\n\r\nCheck a:  (60/7)/2 + (60/7)/5 = 6  ->  (300/7)/10 + (120/7)/10 = 6   ->  420/7 = 60,  60 = 60\r\nCheck b:  (23/3)/3 + (23/3 + 1)/6 = 4  ->   (46/3)/6 + (23/3 + 3/3)/6 = 4  ->   (72/3)/6 = 4  ->  24/6 = 4  ->  4 = 4	\N	\N
167	8	19	A sign placed at the top of a hill on Route 89 says “8% grade. Trucks use lower gear.” What do you think that “8% grade” might mean?		2014-07-16 05:31:37.185842	2014-07-16 05:31:37.185842	8% grade would mean that the rise is 8% of the run, i.e. the road would rise 8 feet for each 100 feet of run.	\N	\N
155	3	18	Exeter building code does not permit building a house that is more than 35 feet tall. An architect working on the design shown at right would like the roof to be sloped so that it rises 10 inches for each foot of horizontal run.\r\n(a) Given the other dimensions in the diagram, will the builder be allowed to carry out this plan?\r\n(b) Two vertical supports (shown dotted in the diagram) are to be placed 6 feet from the center of the building. How long should they be?		2014-07-15 06:00:50.636076	2014-07-24 16:46:08.575095	a) 15 feet of horizontal run, so 15*10 or 150 inches of rise. 150 inches = 12.5 feet + 22 feet below makes 34.5 feet tall, so the house plan is ok\r\nb) 30 - 12 = 18 feet, so each support is 9 feet in from the walls. So each support should be 90 inches long.	PBL_Graph_18_3.PNG	\N
160	1	19	The rectangle ABCD shown at right has sides that are parallel to the coordinate axes. It is three times as wide as it is tall, and its perimeter is 56 units.\r\n(a) Find the length and width of ABCD.\r\n(b) Given the information D = (9; 2), find\r\nthe coordinates for points A, B, and C.		2014-07-16 04:07:46.667708	2014-07-24 16:47:21.429422	4w = 56\r\nw = 14\r\nl = 42\r\n\r\nA= -12,2,  B= =12, -7  C= 9, -7  D= 9,2\r\n	PBL_Graph_19_1.PNG	PBL_Graph_ans_19_1.PNG
161	2	19	A ladder is leaning against the side of a building. Each time I step from one rung to the next, my foot moves 6 inches closer to the building and 8 inches further from the ground. The base of the ladder is 9 ft from the wall. How far up the wall does the ladder reach?		2014-07-16 04:22:27.427678	2014-07-24 16:47:51.514368	9 ft. = 18 steps\r\n18*9 = 162 inches or 13.5 feet	\N	PBL_Graph_ans_19_2.PNG
169	2	20	The perimeter of a rectangle is 100 and its length is x. What expression represents the width of the rectangle?		2014-07-16 05:39:57.903914	2014-07-16 05:39:57.903914	(100-2x)/2	\N	\N
170	3	20	When a third of a number is subtracted from a half of the same number, 60 is the result. Find the number.		2014-07-16 05:42:45.144236	2014-07-16 05:42:45.144236	x/2 - x/3 = 60\r\n3x/6 - 2x/6 = 60\r\n3x - 2x = 360\r\nx = 360\r\n\r\ncheck: 180-120 = 60	\N	\N
171	4	20	Suppose that n represents an integer. What expression represents the next larger integer? the previous integer? the sum of these three consecutive integers?		2014-07-16 05:44:17.255467	2014-07-16 05:44:17.255467	Next larger: n+1\r\nPrevious: n-1\r\nSum of all three:  n -1 + n + n + 1 = 3n	\N	\N
177	1	21	Each beat of your heart pumps approximately 0.006 liter of blood.\r\n(a) If your heart beats 50 times, how much blood is pumped?\r\n(b) How many beats does it take for your heart to pump 0.45 liters?		2014-07-16 20:40:40.114473	2014-07-16 20:40:40.114473	a) 50 * .006 = .3 liters\r\nb) .006/.45 = 75 beats\r\n	\N	\N
172	5	20	Eugene and Wes are solving the inequality 132−4x ≤ 36. Each begins by subtracting 132 from both sides to get −4x ≤ −96, and then each divides both sides by −4. Eugene gets x ≤ 24 and Wes gets x ≥ 24, however. Always happy to offer advice, Alex now suggests to Eugene and Wes that answers to inequalities can often be checked by substituting x = 0 into both the original inequality and the answer. What do you think of this advice? Graph each of these answers on a number line. How do the results of this question relate to the flooding of the Exeter River?		2014-07-16 05:46:09.48577	2014-07-16 20:17:01.065896	Substituting 0 helps because it doesn't work, making clear that the answer has to be greater than 24.\r\na) ===|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========*---------|---------|----\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28 \r\n\r\na) ---|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------*=========|=========|====\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28  \r\nWhen the Exeter river is flooding, it reaches a high point above flood stage, all the values will be less than that high point.	\N	\N
173	6	20	(Continuation) After hearing Alex’s suggestion about using a test value to check an inequality, Cameron suggests that the problem could have been done by solving the equation 132 − 4x = 36 first. Complete the reasoning behind this strategy		2014-07-16 20:06:17.905293	2014-07-16 20:23:10.000556	This will give the base point from which the inequality will continue either left or right. You then know it goes right because 132 - (4*x) has to be less than 32, which requires a larger x.	\N	\N
174	7	20	(Continuation) Deniz, who has been keeping quiet during the discussion, remarks,“The only really tricky thing about inequalities is when you try to multiply them or divide them by negative numbers, but this kind of step can be avoided altogether. Cameron just told us one way to avoid it, and there is another way, too.” Explain this remark by Deniz.		2014-07-16 20:20:31.684823	2014-07-16 20:25:37.164622	Add 4x to both sides, then it isn't necessary to divide by a negative number:\r\n132−4x ≤ 36\r\n132 ≤ 4x + 36\r\n96 ≤ 4x\r\n24 ≤ x\r\n	\N	\N
176	9	20	Solve the following inequality for x: 2(1 − 3x) − (x − 5) > 1\r\n		2014-07-16 20:37:47.227394	2014-07-16 20:37:47.227394	x: 2(1 − 3x) − (x − 5) > 1\r\n   2 - 6x -x + 5 > 1\r\n  -7x + 7 > 1\r\n        7 > 7x _+ 1\r\n        6 ? 7s\r\n       6/7 < x\r\n         x > 6/7\r\n\r\ncheck: 2(1 - 18/7) - (6/7 - 5) = 1\r\n       2 - 36/7 - 6/7 + 5 = 1\r\n               7 - 42/7 = 1\r\n                 7 - 6 = 1	\N	\N
180	4	21	Find the slope of the line containing the points (4; 7) and (6; 11). Find coordinates for another point that lies on the same line and be prepared to discuss the method you used to find them.		2014-07-16 21:03:07.600033	2014-07-16 21:03:07.600033	Slope is (11-7)/(6-4) or 4/2 or 2.\r\n\r\n(5,9) is on the line as we can get 5 by going over 1 from 4, and then 9 by going up 2 from 7.\r\n	\N	\N
181	5	21	Find an easy way to do the following calculations mentally: (a) 25 · 39 · 4 (b) 632/50		2014-07-16 21:06:35.242096	2014-07-16 21:06:35.242096	4 * 25 is 100, times 39 is 3900\r\nIf you divided 632 by 100 you'd get 6.32, so dividing it by 50 would be twice that or 12.64	\N	\N
182	6	21	To earn Hall of Fame distinction at PEA, a girl on the cross-country team must run the 5-km course in less than 20 minutes. What is the average speed of a 20-minute runner, in km per hour? in meters per second? Express your answers to two decimal places.		2014-07-17 16:00:49.551684	2014-07-17 16:00:49.551684	5/20 = .25 km per minute, .25 * 60 = 15.00 km per hour.\r\n.25/60 = .004167 km per second or 4.17 meters per second.\r\n\r\ncheck: 4.17 * 60 * 20 = ~5,000 meters or 5k	\N	\N
183	7	21	The proportion 5/20 = x/60 is helpful for the previous question. Explain this proportion, and assign units to all four of its members.		2014-07-17 16:06:23.356647	2014-07-17 16:06:23.356647	5 km divided by 20 minutes gives speed in km per minute. Since km per hour was asked for, we need to multiply by 60. The 60 under x accomplishes that, so that x when solved will be the speed in km per hour.	\N	\N
175	8	20	Draw the segment from (3; 1) to (5; 6), and the segment from (0; 5) to (2; 0). Calculate their slopes. You should notice that the segments are equally steep, and yet they differ in a significant way. Do your slope calculations reflect this difference?		2014-07-16 20:31:44.607217	2014-07-24 16:50:03.788034	First line slope = 5/2  Second line slope = -5/2\r\n\r\nThey are going in different directions since the slope of the second line is negative.	\N	PBL_Graph_20_8.PNG
178	2	21	(Continuation) Direct-variation equations can be written in the form y = kx, and it is customary to say that y depends on x. Find an equation that shows how the volume V pumped depends on the number of beats n. Graph this equation, using an appropriate scale, and calculate its slope. What does the slope represent in this context?		2014-07-16 20:54:49.800041	2014-07-24 16:50:39.939331	V - .006n\r\n\r\nslope = .3/50 = .006\r\nThe slope is constant k in y = kx.\r\n	\N	PBL_Graph_ans_21_2.PNG
179	3	21	Estimate the slopes of all the segments in the diagram. Identify those whose slopes are negative. Find words to characterize lines that have negative slopes.		2014-07-16 20:57:55.899095	2014-07-24 16:51:03.235456	a) -1/6\r\nb) -5/3\r\nc) 5/3\r\nd) 3/6 or 1/2\r\n\r\nThe ones with negative slope go down from left to right.	PBL_Graph_21_3.PNG	\N
190	3	22	Suppose that n represents a positive even integer. What expression represents the next even integer? the next odd integer? I am thinking of three consecutive even integers, whose sum is 204. What are they?		2014-07-17 16:53:04.701904	2014-07-17 16:53:04.701904	Next even integer is n + 2, next odd is n + 1.\r\n3n + 3 = 204\r\n3n = 201\r\nn = 67\r\n67, 68 , 69\r\n	\N	\N
193	6	22	Day student Chris does a lot of babysitting. When parents drop off their children and Chris can supervise at home, the hourly rate is $3. If Chris has to travel to the child’s home, there is a fixed charge of $5 for transportation in addition to the $3 hourly rate. \r\n(a) Graph y = 3x and y = 3x + 5. What do these lines have to do with the babysitting context? What feature do they have in common? How do they differ?\r\n(b) What does the graph of y = 3x+6 look like? What change in the babysitting context does this line suggest?		2014-07-19 14:23:31.029234	2014-07-24 16:56:47.082761	a) graph attached, these lines show income per hour for the two situations. They have the same slope but intercept the x axis in different places\r\nb) y = 3x + 6 would be parallel to and lie just above the y = 3x + 5 graph. It would suggest the travel rate was $6 instead of $5.	\N	PBL_ans_22_6.PNG
192	5	22	(Continuation) Let t be the number of hours each vehicle has been traveling since 8:00 am (thus t = 0 means 8:00 am), and let d be the number of miles traveled after t hours.\r\nFor each vehicle, write an equation relating d and t.		2014-07-17 17:07:05.981862	2014-07-17 17:07:05.981862	Car - d = t * 52\r\nTruck - d = t * 46	\N	\N
194	7	22	If k stands for an integer, then is it possible for k2 + k to stand for an odd integer?\r\nExplain.		2014-07-19 14:31:03.170072	2014-07-19 14:31:03.170072	If k is even, k^2 + k will be even because it will be the sum of two even numbers. The square must be even because two even numbers multiplied will be even, since they will have 2 as a factor.\r\nIf k is odd, k^2 + k will still be even because it will be the sum of two odd numbers, which must be even. If n is even, n + 1 is odd, and n + 1 + n + 1 or 2n + 2 must be even. An odd number squared must be odd because (n+1)(n+1) = n^2 + 2n + 1. The first two terms are even so adding 1 makes the total odd.	\N	\N
191	4	22	A car and a small truck started out from Exeter at 8:00 am. Their distances from Exeter, recorded at hourly intervals, are recorded in the tables at right. Plot this information on the same set of axes and draw two lines connecting the points in each set of data. What is the slope of each line? What is the meaning of these slopes in the context of this problem?		2014-07-17 17:04:13.918066	2014-07-24 16:56:17.666264	The slope is the speed of the vehicles in miles per hour.The car has a steeper slope as it goes faster.	PBL_Graph_22_4.PNG	PBL_Graph_ans_22_4.PNG
195	8	22	Can you think of a number k for which k2 < k is true? Graph all such numbers on a number line. Also describe them using words, and using algebraic notation.		2014-07-19 14:31:48.785301	2014-07-19 14:40:17.48536	a) ---|---------o---------0=========0---------|-----\r\n     -2        -1         0         1         2     \r\n\r\nNumbers between 0 and 1\r\n0 < k < 1  	\N	\N
196	9	22	One year after Robin deposits 400 dollars in a savings account that pays r% annual interest, how much money is in the account? Write an expression using the variable r.		2014-07-19 14:41:28.330683	2014-07-19 14:41:28.330683	400 + (400*r)	\N	\N
197	10	22	Solve x/4 + (x + 1)/3 ≤ 12\r\nand shade the solution interval on a number line.		2014-07-19 14:49:35.917317	2014-07-19 14:52:08.362108	x/4 + (x + 1)/3 ≤ 12\r\n3x/12 + 4(x+1)/12 ≤ 12\r\n(3x + 4x + 4)/12 ≤ 12\r\n(7x + 4)/12 ≤ 12\r\n7x + 4 ≤ 144\r\n7x ≤ 140\r\nx ≤ 20\r\n\r\na) ===|=========|=========|=========|=========*---------|-----\r\n    -20       -10         0        10        20        30   \r\n\r\ncheck:  20/4 + 21/3 = 12  ->  5 + 7 = 12\r\n	\N	\N
198	11	22	Find three consecutive odd numbers whose sum is 117. Find two ways to do this.		2014-07-19 14:55:14.802405	2014-07-19 14:55:14.802405	n + 1 + n + 3 + n + 5 = 117\r\n3n + 9 = 117\r\n3n = 108\r\nn = 36\r\n37, 39, 41\r\n\r\nor\r\nn + n + 2 + n + 4 = 117\r\n3n + 6 = 117\r\n3n = 111\r\nn = 37\r\n	\N	\N
200	2	23	How much time does it take for a jet to go 119 miles, if its speed is 420 mph? Be sure to specify the units for your answer.		2014-07-19 15:07:02.011331	2014-07-19 15:07:02.011331	119/420 = .2833 hours or about 17 minutes (.2833/60)	\N	\N
201	3	23	Word chains. As the ancient alchemists hoped, it is possible to turn lead into gold. You change one letter at a time, always spelling real words: lead—load—toad—told—gold. Using the same technique, show how to turn work into play.		2014-07-19 18:56:01.073976	2014-07-19 18:56:01.073976	work-pork-perk-pert-peat-plat-play\r\nwork-pork-perk-peak-peat-prat-pray-play	\N	\N
199	1	23	If you graph the line y = 0.5x+3 on your calculator, it is likely that both axis intercepts are visible. If you try to graph y = 0.1x + 18 on your calculator, it is quite likely that the axis intercepts are not both visible. What are the axis intercepts? Describe how to set the calculator’s “window” so that they both become visible.		2014-07-19 15:03:02.41032	2014-07-24 16:57:20.433463	Graph attached. \r\nFirst graph intercepts x at 3 and y at -6.\r\nSecond graph intercepts x at 18 and y at -180.\r\n\r\nRescale the window.	\N	PBL_ans_23_1.PNG
202	4	23	Find coordinates for the points where the line 3x + 2y = 12 intersects the x-axis and the y-axis. These points are called the x-intercept and y-intercept, respectively. Use these points to make a quick sketch of the line.		2014-07-19 19:04:46.104806	2014-07-24 16:57:46.351885	3x + 2y = 12\r\n2y = -3x + 12\r\ny = -3/2x + 6\r\n2y = 12  ->  y intercept = 6\r\n3x = 12  ->  x intercept = 4	\N	PBL_ans_23_4.PNG
203	5	23	Drivers in distress near Exeter have two towing services to choose from: Brook’s Body Shop charges $3 per mile for the towing, and a fixed $25 charge regardless of the length of the tow. Morgan Motors charges a flat $5 per mile. On the same system of axes, represent each of these choices by a linear graph that plots the cost of the tow versus the length of the tow. If you needed to be towed, which service would you call, and why?		2014-07-19 19:13:29.342858	2014-07-24 16:58:09.227494	At 12.5 miles the two services cost the same, $62.50  ( 12.5 * 5 and (12.5 * 3) + 25 ). Any mileage below that Morgan is cheaper, above that Brooks it the cheaper choice.	\N	PBL_ans_23_5.PNG
204	6	23	Compare the graph of y = 2x + 5 with the graph of y = 3x + 5. \r\n(a) Describe a context from which the equations might emerge.\r\n(b) Linear equations that look like y = mx + b are said to be in slope-intercept form.\r\nExplain. The terminology refers to which of the two intercepts?		2014-07-19 19:19:31.23509	2014-07-24 16:58:32.072557	a) There is a flat charge of $5 for any group using a campground, plus an additional $2 or $3 for each person in the group depending on whether its a weekday or a weekend.\r\nb) a is the slope of the line, b is the y intercept.	\N	PBL_ans_23_6.PNG
205	7	23	Driving from Boston to New York one day, Sasha covered the 250 miles in five hours Because of heavy traffic, the 250-mile return took six hours and fifteen minutes. Calculate average speeds for the trip to New York, the trip from New York, and the round trip. Explain why the terminology average speed is a bit misleading.		2014-07-19 19:23:43.139532	2014-07-19 19:23:43.139532	Boston -> NY 250/5 - 50 mph\r\nNY -> Boston 250/6.25 - 40 mph\r\nRound Trip - 500/11.25 - 44.44 mph\r\nAverage speed can be misleading since it wipes out potentially significant differences between the components that make up the average.	\N	\N
206	8	23	Find the value of x that makes 0.1x + 0.25(102 − x) = 17.10 true.		2014-07-19 19:32:43.660287	2014-07-19 19:32:43.660287	0.1x + 0.25(102 − x) = 17.10\r\n0.1x + 25.5 − 0.25x = 17.10\r\n-0.15x + 25.5 = 17.10\r\n.15x = 8.4\r\n   x = 56\r\n\r\nCheck: 0.1(56) + 25.5 − 0.25(56) = 17.10\r\n           5.6 + 25.5 - 14 = 17.10\r\n	\N	\N
207	9	23	So that it will be handy for paying tolls and parking meters, Lee puts pocket change (dimes and quarters only) into a cup attached to the dashboard. There are currently 102 coins in the cup, and their monetary value is $17.10. How many of the coins are dimes?		2014-07-19 19:57:34.673028	2014-07-19 19:57:34.673028	10d + 25(102-d) = 1710\r\n10d + 2550 - 25d   = 1710\r\n15d = 840\r\nd = 56, q = 46\r\n\r\ncheck: 46 *.25 = 11.50 + 5.60 = 17.10	\N	\N
221	11	24	It takes ten Preps ten days to paint ten houses. How many houses can five Preps paint in five days?		2014-07-21 15:09:07.045866	2014-07-21 15:09:07.045866	10p * 10 = 10\r\np = .1\r\n25*.1 = 2.5 houses	\N	\N
208	10	23	Find all the values of x that make 0.1x + 0.25(102 − x) < 17.10 true.		2014-07-19 19:59:00.551065	2014-07-19 20:05:38.543323	0.1x + 0.25(102 − x) < 17.10\r\n0.1x + 25.5 − 0.25x < 17.10\r\n-0.15x + 25.5 < 17.10\r\n.15x > 8.4\r\n   x > 56\r\n	\N	\N
209	11	23	Without using parentheses, write an expression equivalent to 3(4(3x−6)−2(2x+1)).		2014-07-19 20:07:54.397871	2014-07-19 20:07:54.397871	3(4(3x−6)−2(2x+1))\r\n3(12x-24-4x-2)\r\n3(8x-26)\r\n24x-78	\N	\N
210	12	23	One year after Robin deposits P dollars in a savings account that pays r% annual interest, how much money is in the account? Write an expression in terms of the variables P and r. If you can, write your answer using just a single P.		2014-07-19 20:09:08.33843	2014-07-19 20:09:08.33843	P*(1+r)	\N	\N
211	1	24	Day student Morgan left home at 7:00 one morning, determined to make the ten-mile trip to PEA on bicycle for a change. Soon thereafter, a parent noticed forgotten math homework on the kitchen table, got into the family car, and tried to catch up with the forgetful child. Morgan had a fifteen-minute head start, and was pedaling at 12 mph, while the parent pursued at 30 mph. Was Morgan reunited with the homework before reaching PEA that day? If so, where? If not, at what time during first period (math, which starts at 8:00) was the homework delivered?		2014-07-19 20:32:10.359087	2014-07-19 20:32:10.359087	Morgan = 7 + 10/12 = 7.833 arr school ~7:50\r\nParent = 7.25 + 10/30 = 7.58 arr school ~7:35\r\nMorgan got the books before getting to school\r\n7 + d/12 = 7.25 + d/30\r\nd/12 - d/30 = .25\r\n5d/60 - 2d/60 = .25\r\n3d/60 = .25\r\nd/20 = .25\r\nd = 5\r\ntime = 7 + 41.66 or 7.25 + .166\r\n       7.4166\r\nThey met at 7:25, 5 miles down the road.\r\n	\N	\N
212	2	24	Farmer MacGregor needs to put a fence around a rectangular carrot patch that is one and a half times as long as it is wide. The project uses 110 feet of fencing. How wide is the garden?		2014-07-21 01:37:57.239395	2014-07-21 01:37:57.239395	2w + 3w = 110\r\n5w = 110\r\nwidth is 22, length is 33\r\n\r\ncheck: 22+22+33+33 = 110	\N	\N
213	3	24	Combine over a common denominator: 1/a + 2/3a + 3		2014-07-21 04:49:00.190199	2014-07-21 04:49:00.190199	1/a + 2/3a + 3\r\n3/3a + 2/3a + 9a/3a\r\n(9a + 5)/3a	\N	\N
215	5	24	If 6% of x is the same as 5% of 120, then what is x?		2014-07-21 05:01:32.780946	2014-07-21 05:01:32.780946	.06x = .05*120\r\n.06x = 6\r\nx = 6/.06\r\nx = 100\r\n\r\ncheck: 6% of 100 is 6, 5% of 120 is 6.	\N	\N
216	6	24	Find the solution sets and graph them on a number line.\r\n(a) 46 − 3(x + 10) = 5x + 20\r\n(b) 46 − 3(x + 10) < 5x + 20\r\n(c) 46 − 3(x + 10) > 5x + 20		2014-07-21 05:14:19.550857	2014-07-21 05:18:57.3257	a) 46 − 3(x + 10) = 5x + 20  ->  46 - 3x -30 = 5x + 20  ->  16 - 3x = 5x + 20  ->  -4 = 8x  ->  x = -1/2\r\ncheck:  46 - (3(-1/2 + 10) = 5(-1/2) + 20  ->  46 - (-3/2) - 30  = -5/2 + 20   ->   16 + 3/2 = 20 - 5/2 -> 35/2 = 35/2\r\nb) x > -1/2\r\nC) x < -1/2   \r\na) ---|---------|----*----|---------|---------|-----\r\n     -2        -1         0         1         2     \r\na) ---|---------|----o====|=========|=========|-----\r\n     -2        -1         0         1         2     \r\na) ===|=========|====o----|---------|---------|-----\r\n     -2        -1         0         1         2     	\N	\N
217	7	24	At 1 pm, you start out on your bike at 12 mph to meet a friend who lives 8 miles away. At the same time, the friend starts walking toward you at 4 mph. How much time will elapse before you meet your friend? How far will your friend have to walk?		2014-07-21 14:42:42.792549	2014-07-21 14:42:42.792549	12t + 4t = 8\r\n16t = 8\r\nt = 1/2\r\nt = 30 minutes\r\nFriend has to walk 2 miles.\r\n\r\ncheck: walker goes 2 miles in 1/2 hour, cyclist goes 6 miles in 1/2 hour.\r\n   	\N	\N
218	8	24	The population of a small town increased by 25% two years ago and then decreased by by 25% last year. The population is now 4500 persons. What was the population before the two changes?		2014-07-21 14:47:54.177375	2014-07-21 14:47:54.177375	 4500/.75 = 6000 last year\r\n 6000/1.25 = 4800 two years ago\r\n\r\ncheck: 4800 * 1.25 = 6000 * .75 = 4500\r\n	\N	\N
219	9	24	Given that it costs $2.75 less to buy a dozen doughnuts than to buy twelve single doughnuts, and that 65 doughnuts cost $25.25, and that 65 = 5 · 12 + 5, what is the price of a single doughnut?		2014-07-21 14:57:58.279677	2014-07-21 14:57:58.279677	65d - (5*2.75) = 25.25\r\n65d = 25.25 + 13.75\r\n65d = 39\r\nd = .6\r\n60 cents per donut\r\n\r\ncheck: 65d * .6 = 39 - (5*2.75) = 25.25	\N	\N
220	10	24	The volume of a circular cylinder is given by the formula V = r^2h.\r\n(a) To the nearest tenth of a cubic cm, find the volume of a cylinder that has a 15-cm radius and is 12-cm high.\r\n(b) Solve the volume formula for h. Then, if the volume is 1000 cc and the radius is 10 cm, find h to the nearest tenth of a cm.		2014-07-21 15:04:49.084852	2014-07-21 15:04:49.084852	a) pi*15*15*12 = 8,482.3 cm*3\r\nb) h = V/(pi*r^2)\r\n1000/(pi*100) = 3.2 cm	\N	\N
222	1	25	Which of the following pairs of quantities vary directly?\r\n(a) the circumference of a circle and the diameter of the circle;\r\n(b) the distance traveled in two hours and the (average) rate of travel;\r\n(c) the number of gallons of gasoline bought and the cost of the purchase;\r\n(d) the area of a circle and the radius of the circle.		2014-07-21 15:12:46.515593	2014-07-21 15:12:46.515593	a) varies directly, as the circumference is always pi times the diameter\r\nb) varies directly, as doubling the average rate will double the distance traveled\r\nc) varies directly, as the cost will be the gallons bought times the price per gallon\r\nd) doesn't vary directly, as the area will increase by the square of the radius	\N	\N
238	9	26	After you graph the line y = 4x + 6, find\r\n(a) the y-coordinate of the point on the line whose x-coordinate is 2;\r\n(b) the x-coordinate of the point on the line whose y-coordinate is 2.\r\n		2014-07-23 18:54:13.463923	2014-07-24 17:03:03.738643	a) 4*2 + 6, 14\r\nb) 2 = 4x + 6, 4x = -4, x = -1\r\n	\N	PBL_ans_26_9.PNG
223	2	25	A jet, cruising at 26400 feet, begins its descent into Logan Airport, which is 96 miles away. Another jet, cruising at 31680 feet, is 120 miles from Logan when it begins its descent. Which of these two paths of descent is steeper? Explain.		2014-07-21 15:17:31.299776	2014-07-21 15:17:31.299776	Jet 1 has to descend 26400/96 or 275 feet per mile\r\nJet 2has to descend 31680/120 or 264 feet per mile\r\n\r\nJet 1 has the steeper descent	\N	\N
224	3	25	The diagram shows two steel rods hinged at one end. The other end is connected by a bungee cord (the dotted segment), whose unstretched length is 10 inches. The rods are 5 inches and 18 inches long. Use inequality symbols to describe all the possible lengths for the bungee cord, which stays attached at both ends while it is being stretched.		2014-07-21 15:20:42.291852	2014-07-21 15:20:42.291852	10 <= l <= 23 in inches, assuming the cord can be stretched that far.	\N	\N
225	4	25	According to the US Census Department, someone born in 1950 has a life expectancy of 68.2 years, while someone born in 1970 has a life expectancy of 70.8 years.\r\n(a) What is a reasonable life expectancy of someone born in 1960?\r\n(b) What is a reasonable life expectancy of someone born in 1980?\r\n(c) What is a reasonable life expectancy of someone born in 2000?\r\nPart (a) is an interpolation question. Parts (b) and (c) are extrapolation questions. Which of your answers are you the most confident about? Explain.		2014-07-21 15:26:36.719085	2014-07-21 15:26:36.719085	a) (70.8 + 68.2)/2 = 69.5\r\nb) 70.8 + 1.3 = 72.3\r\nc) 72.3 + 2.6 = 74.9\r\nWe can be more confident in the interpolation (a) as it is very unlikely that the value wasn't somewhere between the value 10 years earlier and the value 10 years later. The extrapolated values assume that the improvement is constant when in fact it could be accelerating or slowing down. 	\N	\N
226	5	25	Multiply 2 + x by 2x. Draw an algebra-block diagram to illustrate this calculation.		2014-07-21 15:32:11.721768	2014-07-21 15:32:11.721768	2x(2+x) = 4x + 2x^2\r\n   XXXXXXXXXXXXXXXX\r\n   X      |   |   X\r\n2x X      |   |   X\r\n   X      |   |   X\r\n   XXXXXXXXXXXXXXXX\r\n      x     1   1 	\N	\N
229	8	25	Solve the following inequalities and shade their solution intervals on a number line.\r\n(a) 2x/3 + (3x + 5)/2 ≤ 5 \r\n(b) 1/2(x − 1) + 3 > 1/3(2x + 1) − 1		2014-07-21 16:00:06.438912	2014-07-21 16:06:16.684368	(a) 2x/3 + (3x + 5)/2 ≤ 5 \r\n4x/6 + (9x + 15)/6 ≤ 5\r\n4x + 9x + 15 ≤ 30\r\n13x ≤ 15\r\nx ≤ 15/13\r\n ===|=========|=========|=========|*--------|-----\r\n   -2        -1         0         1         2     \r\n\r\n\r\n(b) 1/2(x − 1) + 3 > 1/3(2x + 1) − 1\r\n2x - 2 + 3 > 7x + 3 - 1\r\n2x - 1 > 7x + 2\r\n-3 > 5x\r\nx < -5/3\r\n---|--o======|=========|=========|=========|====\r\n  -2        -1         0         1         2     \r\n\r\n\r\n\r\n	\N	\N
230	1	26	A square game board is divided into smaller squares, which are colored red and black as on a checkerboard. All four corner squares are black. Let r and b stand for the numbers of red and black squares, respectively. What is the value of the expression b − r?		2014-07-21 16:11:13.530488	2014-07-21 16:11:30.50077	BWB BWBWB\r\nWBW WBWBW\r\nBWB BWBWB\r\n    WBWBW\r\n    BWBWB\r\n\r\nThere will always be 1 more black square than white square. The number of squares must be odd to get a black on each corner. Thus there must be one more square in one set than the other, since they are otherwise alternating, like odd and even numbers.	\N	\N
235	6	26	For what values of x will the square and the rectangle shown at right have the same perimeter?		2014-07-23 18:31:15.380073	2014-07-24 17:01:40.546208	4(x+5) = 2(x + 3) + 2(x + 7)\r\n4x + 20 = 4x + 6 + 16\r\nx = x\r\nAll positive numbers.	PBL_26_6.PNG	\N
232	3	26	What is the slope between (3; 7) and (5; 4)? (5; 4) and (3; 7)? \r\n(a; b) and (c; d)? \r\n(c; d) and (a; b)?		2014-07-23 18:10:33.80368	2014-07-23 18:10:33.80368	a) (7/4)/(3-5) = -3/2\r\nb) (b-d)/(a-c)\r\nc) (d-b)/(c-a)\r\n	\N	\N
233	4	26	On top of a fixed monthly charge, Avery’s cellphone company adds a fee for each text message sent. Avery’s June bill was $50.79, which covered 104 text messages. The bill for May, which covered 83 text messages, was only $46.59.\r\n(a) What is the price of a text message?\r\n(b) What is the fixed monthly charge?\r\n(c) What would Avery be charged for a month that included 200 text messages?\r\n(d) What would Avery be charged for a month that included n text messages?		2014-07-23 18:23:09.341671	2014-07-23 18:23:09.341671	a) 50.79 - 46.59 = *104-83)t\r\n    4.20 = 21t\r\n       6 = 20 cents each\r\nb) 50.79 - (104*.2) = 29.99 or 46.59 - (83 * . 2) = 29.99\r\nc) 29.99 + (200*.2) = 69.99\r\nd) 29.99 + (.2n)\r\n	\N	\N
234	5	26	A friend suggested that I change my cellphone company. This new company has a fixed monthly charge of $39.99, but it charges only 12 cents for each text message. Is this a better deal than the one described in the previous problem? Give evidence.		2014-07-23 18:27:25.614571	2014-07-23 18:27:25.614571	If Avery averages around 100 text messages the monthly cost would be 39.99 + 100*.12) = 51.99. If Avery increased the number of texts it would begin to be a better value, but at the current number it isn't.	\N	\N
231	2	26	At noon, my odometer read 6852 miles. At 3:30 pm, it read 7034 miles.\r\n(a) What was my average rate of change during these three and a half hours?\r\n(b) Let t represent the number of hours I have been driving since noon and y represent\r\nmy odometer reading. Write an equation that relates y and t. Assume constant speed.\r\n(c) Graph your equation.\r\n(d) Show that the point (5,7112) is on your line, and then interpret this point in the\r\ncontext of this problem.		2014-07-23 18:06:28.967535	2014-07-24 17:01:21.315962	a) 7034-6852 = 182/3.5 = 52 mph\r\nb) d = (y-6852)/t + 6852\r\nc) attached\r\nd) (7112-6852)/5 + 6852 = 7112, after 5 hours at 52 mph the distance would be 260 miles, which is 7112 on the odometer.	\N	PBL_ans_26_2.PNG
236	7	26	The point (3; 2) is on the line y = 2x + b. Find the value of b. Graph the line.		2014-07-23 18:39:41.551045	2014-07-24 17:02:14.122771	2 = 6 + b\r\nb = -4\r\ny = 2x - 4\r\n	\N	PBL_ans_26_7.PNG
237	8	26	Are (2; 9) and (−3;−6) both on the line y = 4x+6?\r\nIf not, find an equation for the line that does pass through both points.		2014-07-23 18:49:35.99636	2014-07-24 17:02:38.645902	y = 4x + 6\r\n9 = 4(2) + 6? no for (2, 9) 9 != 14\r\n-6 = 4*(-3) + 6, yes for (-3, -6), -6 = -6\r\nslope is (9- -6)/(2 - -3) or 15/5 or 3\r\n9 = 3(2) + b\r\nb = 3\r\ny = 3x + 3	\N	PBL_ans_26_8.PNG
239	10	26	In each of the following, describe the rate of change between the first pair and the second, assuming that the first coordinate is measured in minutes and the second coordinate is measured in feet. What are the units of your answer?\r\n(a) (2; 8) and (5; 17) \r\n(b) (3.4; 6.8) and (7.2; 8.7) \r\n(c) (3/2;−3/4) and (1/4; 2)		2014-07-23 19:03:38.012657	2014-07-23 19:03:38.012657	a) (17-8)/(5-2) = 9/3 = 3 feet per minute\r\nb) (8.7-6.8)/(7.2-3.4) = 1.9/3.8  = 0.5 of a foot per minute\r\nc) (2 - -3/4)/(1/4 - 3/2) = 2.75/-1.25 = -0.7 feet per minute	\N	\N
240	1	27	If you double all the sides of a square, a larger square results. By what percentage has the perimeter increased? By what percentage has the area increased?		2014-07-23 19:06:33.699894	2014-07-23 19:22:50.995155	square side 1, area = 1, perimeter = 4\r\nsquare side 2, area = 4, perimeter = 8\r\nsquare side 4, area = 16, perimeter = 16\r\nsquare side 8, area = 64, perimeter = 32\r\nArea is 4 times bigger or 400 percent, perimeter is 2 times bigger 200 percent.	\N	\N
241	2	27	Given the five numbers 8/25, 13/40, 19/60, 33/100, and 59/180, find the two that are closest together on a number line, and find the distance between them.		2014-07-24 01:02:36.27247	2014-07-24 01:02:36.27247	8/25 = 64/200 = .32\r\n13/40 = 65/200 = .325\r\n19/60 = 57/180 = .31667\r\n33/100 = 66/200 = .33\r\n59/180 = .327777\r\n.3167 - .32 - .325 - .3277 - .33\r\n   .0033   .005   .00277  .002223\r\nClosest ar 69/190 and 33/100, they are .00222223 apart	\N	\N
244	5	27	How far apart on a number line are\r\n(a) 12 and 18? (b) 12 and −7? (c) −11 and −4?		2014-07-24 01:15:32.189599	2014-07-24 01:15:32.189599	a) 6\r\nb) 19\r\nc) 7	\N	\N
245	6	27	A toy manufacturer is going to produce a new toy car. Each one costs $3 to make, and the company will also have to spend $200 to set up the machinery to make them.\r\n(a) What will it cost to produce the first hundred cars? the first n cars?\r\n(b) The company sells the cars for $4 each. Thus the company takes in $400 by selling one hundred cars. How much money does the company take in by selling n cars?\r\n(c) How many cars does the company need to make and sell in order to make a profit?		2014-07-24 01:21:10.013704	2014-07-24 01:21:10.013704	a( first 100 cars = 200 + (100*3), first n cars = 200 + (3n)\r\nb) 4n - (200 + 3n) -> n - 200\r\nc) 201 cars. \r\n\r\ncheck= 201 * 4 = 804 - (200 + 603) = $1 profit.	\N	\N
246	7	27	What is the distance between 6 and −6? between 24 and 17? between 17 and 24? between t and 4? The distance between two points is always positive. If a and b are two points on a number line, the distance is therefore either a − b or b − a, whichever is non-negative. This is an example of an absolute-value calculation, and the result is written |a − b|. What is the meaning of |b − a|?		2014-07-24 01:26:05.886745	2014-07-24 01:26:05.886745	Distance between 6 and -6 is 12.\r\nDistance between 23 and 17 is 6.\r\nDistance between t and 4 is the absolute value (i.e. the positive value) of t - 4.\r\nThe meaning of |b − a| is that after the subtraction is done if the value is negative it is converted to positive, i.e. multiplied by -1.	\N	\N
247	8	27	A cyclist rides 30 km at an average speed of 9 km/hr. At what rate must the cyclist cover the next 10 km in order to bring the overall average speed up to 10 km/hr.?		2014-07-24 01:32:33.376314	2014-07-24 01:32:33.376314	30/9 + 10/t = 4 since to average 10 km/h the cyclist must cover 40 km in 4 hours.\r\n10/t = 36/9 - 30/9\r\n10/t = 6/9\r\n6/9t = 10\r\n6t = 90\r\nt = 15, the cyclist needs to go 15 k/h to average 10 k/h\r\n\r\ncheck: 30/9 + 10/15 = 3 1/3 + 1/3 = 4	\N	\N
248	9	27	Let P = (x; y) and Q = (1; 5). Write an equation that states that the slope of line PQ is 3. Show how this slope equation can be rewritten in the form y−5 = 3(x−1). This linear equation is said to be in point-slope form. Explain the terminology. Find coordinates for three different points P that fit this equation.		2014-07-24 01:37:38.656318	2014-07-24 01:37:38.656318	(y - 5)/(x - 1) = 3\r\ny - 5 = 3(x - 1)\r\nThe coefficient before the term on the right is the slope of the line.\r\nThe number subtracted from 5 is y when the number subtracted from x is 1.\r\n(1,5), (2,8), (3,11), (0,2)\r\n\r\ny = 3x - 3 + 5\r\ny = 3x + 2	\N	\N
250	11	27	Another word chain: Turn big into red into win. Change one letter at a time, always spelling real words.		2014-07-24 01:46:36.179574	2014-07-24 01:46:36.179574	big - bid - bed - red - rid - bid - bin - win 	\N	\N
242	3	27	Find the x-intercept and the y-intercept of the equation y = −(3/2)x + 6. Graph		2014-07-24 01:07:21.916651	2014-07-24 17:03:23.923622	x intercept = 4\r\ny intercept = 6	\N	PBL_ans_27_3.PNG
251	1	28	Given that 48 ≤ n ≤ 1296 and 24 ≤ d ≤ 36, what are the largest and smallest values that the expression n/d can possibly have? Write your answer smallest ≤ nd ≤ largest		2014-07-24 01:50:19.030643	2014-07-24 03:55:39.003102	48/36  ≤ n/d ≤ 1296/24	\N	\N
243	4	27	The graph shows how the length (measured in cm) of a pendulum is related to the time (measured in sec) needed for the pendulum to make one complete back-and-forth movement (which is called the period). Find the length of a pendulum that swings twice as often as a 30-cm pendulum.		2014-07-24 01:13:36.603451	2014-07-24 04:12:51.64918	A 30 cm length takes ~1.1 second per swing, so we need a swing of about .55 seconds.\r\nThat would appear to be about 7.8 seconds.\r\n\r\n	PBL_27_4.PNG	\N
252	2	28	Jess has 60 ounces of an alloy that is 40% gold. How many ounces of pure gold must be added to this alloy to create a new alloy that is 75% gold?		2014-07-27 03:58:03.076829	2014-07-27 03:58:03.076829	o/.4 = 60, o = 24 ounces in pure gold in original sample\r\n24 + n/(60 + n) = .75\r\n24 + n = .75(60 + n)\r\nn + 24 = 45 + .75n\r\n.25n = 21\r\nn = 21/.25\r\nn = 84 ounces must be added. Final total weight is 144 ounces, with 108 ounces of pure gold.\r\ncheck: 24 + 84 = (60 + 84) * .75\r\n108 = 108\r\n	\N	\N
249	10	27	(Continuation) What do the lines y = 3(x−1)+5, y = 2(x−1)+5, and y = −1/2(x−1)+5 all have in common? How do they differ from each other?		2014-07-24 01:44:14.742012	2014-07-24 04:14:13.592957	They all pass through the point (1,5), but they have different slopes.	\N	PBL_ans_27_10.PNG
228	7	25	For each of the following situations, draw a plausible graph that shows the relationship\r\nbetween the time elapsed (horizontal axis) and the indicated speed (vertical axis). In other\r\nwords, graph speed versus time for each of the following:\r\n(a) A car in a bumper test travels at a steady speed until it crashes into a wall.\r\n(b) Your workout consists of some jogging, some hard running, some more jogging, some more hard running, and finally some walking.\r\n(c) A roller coaster slowly climbs up a steep ramp and then zooms down the other side.\r\n(Plot the car’s speed just to the bottom of the first hill.)\r\n(d) A car speeds at a steady rate along a highway until an officer pulls it over and gives\r\nthe driver a ticket. The car then resumes its journey at a more responsible speed.		2014-07-21 15:52:20.995214	2014-07-24 17:00:29.187383	Graph attached	\N	PBL_ans_25_7.PNG
253	3	28	The table at right shows data that Morgan collected during a 10-mile bike ride that took 50 minutes. The cumulative distance (measured in miles) is tabled at ten-minute intervals. \r\n(a) Make a scatter plot of this data. Why might you expect the data points to line up? Why do they not line up?\r\n(b) Morgan’s next bike ride lasted for 90 minutes. Estimate its length (in miles), and explain your method. What if the bike ride had lasted t minutes; what would its length be, in miles?		2014-07-27 04:15:00.496569	2014-07-27 04:15:00.496569	a) attached. Humans don't ride bikes at a constant speed even on the flats, and hills would further affect her speed.\r\nb) The estimate is 18 miles, based on her average speed of about 1 mile every 5 minutes, i.e. .2 miles per minute or about 12 mph. So the estimate would be t*.2.	PBL_Graph_28_3.PNG	PBL_ans_28_3.PNG
130	5	15	It takes one minute to fill a four-gallon container at the Exeter spring. How long does it take to fill a six-gallon container? Fill in the missing entries in the table below, and plot points on the grid at right.\r\n---------------------------------------------------\r\n| 1  |    |    | 2  |    | 3  |    | 4  |    | 5  | \r\n|--------------------------------------------------\r\n| 4  | 5  | 6  |    | 11 |    | 14 |    | 19 |    |\r\n---------------------------------------------------\r\nNotice that it makes sense to connect the dots you plotted (thereby forming a continuous pattern). Is the same true of the sunset-time graph you looked at recently? Explain.		2014-07-14 04:11:10.321784	2014-07-24 04:30:30.060299	---------------------------------------------------\r\n| 1  |1.25| 1.5| 2  |2.75| 3  | 3.5| 4  |4.75| 5  | \r\n|--------------------------------------------------\r\n| 4  | 5  | 6  | 8  | 11 | 12 | 14 | 16 | 19 | 20 |\r\n---------------------------------------------------	PBL_Graph_15_5a.PNG	pbl_ans_15_5.PNG
36	4	4	Profits for the Whirligig Sports Equipment Company for six fiscal years, from 1993 through 1998, are graphed at right. The vertical scale is in millions of dollars. Describe the change in profit from\r\n(a) 1993 to 1994;\r\n(b) 1994 to 1995;\r\n(c) 1997 to 1998.\r\nDuring these six years, did the company make an overall profit or sustain an overall loss? What was the net change?		2014-07-09 04:19:49.81674	2014-07-24 16:29:58.157419	a) down 1.1%\r\nb) down 3.2%\r\nc) done 1.7%\r\n2.6+1.5-1.7+1.8-0.6-2.3 = net profit of 1.3 million\r\n\r\n	PBL_Graph_4_4.PNG	\N
102	9	11	There are 396 persons in a theater. If the ratio of women to men is 2:3, and the ratio of men to children is 1:2, how many men are in the theater? .		2014-07-12 15:41:06.912791	2014-07-24 16:35:57.862393	Men           Women           Children             Total\r\n100           150             200                  450\r\n 80           120             160                  360\r\n\r\nm + 3/2m + 2m = 396\r\n2m + 3m + 4m = 792\r\n9m = 792\r\nm = 88\r\n\r\nCheck:  88 + 132 + 176 = 396	PBL_Graph_11_9.PNG	\N
120	1	14	The graph displays the time of sunset at Exeter during September. Some questions:\r\n\r\nAt what time did the sun set on the 5th of September? on the 30th of September?		2014-07-12 20:33:21.101344	2014-07-24 16:36:40.47957	Sept. 5 - a little before 7:10\r\nSept. 30 - a little after 6:26	PBL_Graph_14_1_6_1_.PNG	\N
145	3	17	Sandy recently made a 210-mile car trip, starting from home at noon. The graph at right shows how Sandy’s distance from home (measured in miles) depends on the number of hours after noon. Make up a story that accounts for the four distinct parts of the graph. In particular, identify the speed at which Sandy spent most of the afternoon driving.		2014-07-14 19:39:31.026864	2014-07-24 16:44:56.528467	For the first hour Sandy was in local traffic averaging 30 mpg. Then she got on the highway and was able to average 60 mph. She stopped for food after 2 hours and spent 1 hour. Then she drove 2 more hours on the freeway at 60 mph. So for the majority of the day she was driving at 60 mph, although her average speed was only a bit over 40 for the whole trip.	PBL_Graph_17_3.PNG	\N
152	1	18	To do a college visit, Wes must make a 240-mile trip by car. The time required to complete the trip depends on the speed at which Wes drives, of course, as the table below shows. Fill in the missing entries, and\r\nplot points on the grid provided. Do the quantities time and speed vary directly? It makes sense to connect your plotted points with a continuous graph. Explain why.\r\n\r\n         ---------------------------------------------------\r\nspeed    | 15 | 20 | 25 |    |    | 48 |    | 60 |    | r  | \r\n         |--------------------------------------------------\r\ntime     |    | 12 |    |  8 |  6 |    | 4.8|    |  3 |    |\r\n         ---------------------------------------------------		2014-07-14 20:18:13.60202	2014-07-24 16:45:44.037068	         ---------------------------------------------------\r\nspeed    | 15 | 20 | 25 | 30 | 40 | 48 | 50 | 60 | 80 | r  | \r\n         |--------------------------------------------------\r\ntime     | 16 | 12 | 9.6|  8 |  6 | 5  | 4.8|  4 |  3 | d/r|\r\n         ---------------------------------------------------\r\nThey vary directly but inversely, as one goes up the other goes down at the same ratio.	PBL_Graph_18_1a.PNG	\N
159	7	18	Shown at right, the y-block and xy-block are two more members of the algebra-block family. Draw an algebra-block diagram that illustrates the equation (1 + x)y = y + xy.		2014-07-15 06:19:10.992103	2014-07-24 16:46:41.510458	   XXXXXXXXXXXXXXXXX\r\n   X   |           X\r\ny  X   |           X\r\n   X   |           X\r\n   XXXXXXXXXXXXXXXXX\r\n     1       x \r\n	PBL_18_7.PNG	\N
165	6	19	At noon one day, the Exeter River peaked at 11 feet above flood stage. It then began to recede, its depth dropping at 4 inches per hour. \r\n(a) At 3:30 that afternoon, how many inches above flood stage was the river?\r\n(b) Let t stand for the number of hours since noon, and h stand for the corresponding number of inches that the river was above flood stage. Make a table of values, and write an equation that expresses h in terms of t.\r\n(c) Plot h versus t, putting t on the horizontal axis.\r\n(d) For how many hours past noon was the river at least 36 inches above flood stage?		2014-07-16 05:17:57.899393	2014-07-24 16:48:46.968094	a) 9 feet, 10 inches\r\nb) time   } 12 |  1  |  2  |  3  |  4  |  t  |\r\n   height | 11 |10.67|10.33| 10  |9.67 | 11-(t*.33)\r\nc) attached\r\nd) 11-(.33t) = 3  ->  -.33t = -8  ->   t = 24 hours\r\n\r\n	\N	PBL_Graph_ans_19_6.PNG
168	1	20	Jess and Taylor go into the cookie-making business. The chart shows how many dozens of cookies were baked and sold (at $3.50 per dozen) during the first six days of business.\r\n(a) What was their total income during those six days?\r\n(b) Which was more profitable, the first three days or the last three days?\r\n(c) What was the percentage decrease in sales from Tuesday to Wednesday? What was the percentage increase in sales from Wednesday to Thursday?\r\n(d) Thursday’s sales were what percent of the total sales?\r\n(e) On average, how many dozens of cookies did Jess and Taylor bake and sell each day?		2014-07-16 05:38:47.902366	2014-07-24 16:49:05.630876	a) 12 + 24 + 10 + 16 + 20 + 14 = 96 * 3.50 = $336.00.\r\nb) First 3, 46 dozen, Second three, 50 dozen, the second three days.\r\nc) 58.3%, 60%\r\nd) 16/96 = 16.67%\r\ne) 96/6 = 16.67	PBL_Graph_20_1.PNG	\N
188	1	22	Each of the data sets at right represents points on a line. \r\nIn which table is one variable directly related to the other?\r\nWhy does the other table not represent a direct variation?\r\nFill in the missing entry in each table.	Introducing x intercept concept.	2014-07-17 16:40:49.722085	2014-07-24 16:51:34.449118	The second table is clearly a direct variation.\r\nThe first one doesn't start from the origin, so you have to add 4 to get the y value. Other than that it is the same variation as the second table.\r\n24, 28 	PBL_Graph_22_1.PNG	\N
214	4	24	Confirm that the five points in the table all lie on a single line. Write an equation for the line. Use your calculator to make a scatter plot, and graph the line on the same system of axes.		2014-07-21 04:56:26.830199	2014-07-24 16:59:06.418924	They vary directly as each time x goes up by 1, y goes down by 2\r\ny = -2x + 1\r\n	PBL_24_4.PNG	PBL_ans_24_4.PNG
227	6	25	When it is 150 miles west of its destination, a jet is flying at 36920 feet. When it is 90 miles west of its destination, the jet is at 21320 feet. Using this data, sketch a graph of the jet’s descent. Is a linear model reasonable to use in this situation? Explain.		2014-07-21 15:43:32.091357	2014-07-24 17:00:00.597823	It is reasonable to use a linear model as the jet has to end at 0,0 and the two points make almost a straight line. However, in reality the jet probably descends faster at first and slows up its descent as it gets closer to the ground.	\N	PBL_ans_25_6.PNG
255	5	28	The equation 5x−8y = 20 expresses a linear relationship between x and y. The point (15; 7) is either on the graph of this line, above it, or below it. Which? How do you know?		2014-07-27 04:24:16.535036	2014-07-27 04:24:16.535036	Substituting 15 for x and 7 for y, which makes 75 - 56 = 20. 75 - 56 = 19, which is less than 20. The point would be below the line since solving with 15 for x gives 75 - 8y = 20 -> 8y = 55 -> y = 6.875, which is less than 7. 	\N	\N
256	6	28	Write an equation for the line that contains the points in the table, and make up a context for it.		2014-07-27 04:31:45.141582	2014-07-27 04:31:45.141582	(y - 100) = 4x\r\nor \r\ny = 4x + 100\r\n\r\nStarting from a base score of 100, you get 4 points for each right answer on a test.\r\n	PBL_Graph_28_6.PNG	\N
257	7	28	On a number line, how far is each of the following numbers from zero?\r\n(a) 45 (b) −7 (c) x (d) x + 2 (e) 0		2014-07-27 04:33:56.180619	2014-07-27 04:33:56.180619	a) 45\r\nb) 7\r\nc) |x|\r\nd) |x + 2|\r\ne) 0	\N	\N
258	8	28	Solve \r\n(a) A = 1/2 bh for b; \r\n(b) A = 2rh + r^2 for h.		2014-07-27 04:38:18.385302	2014-07-27 04:38:18.385302	a) 2A = bh -> b = 2A/h\r\nb) b = (A - r^2)/2r	\N	\N
259	9	28	On a number line, how far is each of the following numbers from 5?\r\n(a) 17 (b) −4 (c) x (d) x + 3 (e) x − 1		2014-07-27 04:45:34.644762	2014-07-27 04:45:34.644762	a) 12\r\nb) 9\r\nc) |x - 5|\r\nd) |x - 2|\r\ne) |x - 6|	\N	\N
260	10	28	Interpret each of the following as the distance between two numbers on a number line.\r\n(a) |x − 7| (b) |3 − x| (c) |x + 5| (d) |x|		2014-07-27 04:55:34.024054	2014-07-27 04:55:34.024054	a) two numbers that are 7 apart, i.e. 7,0   10,3   3,-4  or  -10, -17\r\nb) two numbers that are 3 apart, i.e. 3,0   10,7   1,-2  or  -10, -13\r\nc) two numbers that are 5 apart, i.e. 0,5   5,10   5,-5  or  -10, -5\r\nd) a number that is positive and the same number except negative 	\N	\N
261	11	28	To graph linear equations such as 3x + 5y = 30, one can put the equation into slopeintercept form, but (unless the slope is needed) it is easier to find the x- and y-intercepts and use them to sketch the graph. Find the axis intercepts of each of the following and use them to draw the given line. An equation ax + by = c is said to be in standard form.\r\n(a) 20x + 50y = 1000 (b) 4x − 3y = 72		2014-07-27 05:02:33.296341	2014-07-27 05:02:33.296341	a) 20x = 1000, y intercept = 50.  50y = 1000, x intercept = 20.\r\nb) 4x = 72, y intercept = 18.   3y = 72,   x intercept = 24.	\N	PBL_Graph_28_11.PNG
262	12	28	Find an equation for the line containing the points (−3, 0) and (0, 4).		2014-07-27 05:10:30.611234	2014-07-27 05:10:30.611234	y = 4/3x + 4\r\n3y = 4x + 12\r\n-4x + 3y = 12\r\n	\N	\N
263	13	28	Multiply x + 2y by 3y. Draw an algebra-block diagram to illustrate this calculation.		2014-07-27 05:16:46.259367	2014-07-27 05:16:46.259367	6y^2 + 3xy\r\n\r\n   XXXXXXXXXXXX\r\n y X      | | X\r\n   XXXXXXXXXXXX\r\n y X      | | X\r\n   XXXXXXXXXXXX\r\n y X      | | X\r\n   XXXXXXXXXXXX\r\n      x    y y  	\N	\N
264	1	29	Write an equation in point-slope form for\r\n(a) the line that goes through (2; 5) and (6;−3);\r\n(b) the line that goes through point (h; k) and that has slope m.		2014-07-27 05:23:42.363714	2014-07-27 05:23:42.363714	a) (y - 5) = -2(x - 2)  check-  y intercept = 9,  x - intercept = 4.5\r\nb) (y - k) = m(x - h)\r\n	\N	\N
265	2	29	Casey goes for a bike ride from Exeter to Durham, while an odometer keeps a cumulative record of the number of miles traveled. The equation m = 12t + 37 describes the odometer reading m after t hours of riding. What is the meaning of 12 and 37 in the context of this trip?		2014-07-27 05:27:48.999025	2014-07-27 05:27:48.999025	12 is the slope (m), which in this case indicates 12 mph.\r\n37 is the beginning odometer reading, which is also the y intercept.	\N	\N
266	3	29	Find an equation for the line that passes through the points (4.1, 3.2) and (2.3, 1.6).		2014-07-27 05:35:57.642901	2014-07-27 05:35:57.642901	Slope is 1.6/1.8, or 8/9\r\n(y - 3.2) = 8/9(x - 4.1)\r\nor\r\n9y - 28.8 = 8x - 32.8\r\n9y = 8x - 4\r\ny = 8/9x - 4/9	\N	PBL_ans_29_3.PNG
267	4	29	Find coordinates for all the points on a number line that are\r\n(a) six units from 0; (b) six units from four; (c) six units from −7; (d) six units from x.		2014-07-27 05:39:15.808557	2014-07-27 05:39:15.808557	a) (6, -6)\r\nb) (10, -2)\r\nc) (-13, -1)\r\nd) (x+6, x-6)	\N	\N
268	5	29	Rearrange the eight words “between”, “4”, “the”, “17”, “is”, “and”, “x”, and “distance” to form a sentence that is equivalent to the equation |x−17| = 4. By working with a number line, find the values of x that fit the equation		2014-07-27 05:44:10.37886	2014-07-27 05:44:10.37886	4 is the distance between 17 and x.\r\n13 and 21.\r\n----*---------|---------|---------|---------|---------|---------|---------|---------*---------|----\r\n   13        14        15        16        17        18        19        20        21        22	\N	\N
269	6	29	As you know, temperatures can be measured by either Celsius or Fahrenheit units; 30◦C is equivalent to 86◦F, 5◦C is equivalent to 41◦F, and −10◦C is equivalent to 14◦F. \r\n(a) Plot this data with C on the horizontal axis and F on the vertical axis.\r\n(b) Verify that these three data points are collinear.\r\n(c) Find a linear equation that relates C and F.\r\n(d) Graph F versus C. In other words, graph the linear equation you just found.\r\n(e) Graph C versus F. You will need to re-plot the data, with C on the vertical axis.\r\n(f) On New Year’s Day, I heard a weather report that said the temperature was a balmy 24◦C. Could this have happened? What is the corresponding Fahrenheit temperature?\r\n(g) Water boils at 212◦F and freezes at 32◦F at sea level. Find the corresponding Celsius temperatures.\r\n(h) Is it ever the case that the temperature in degrees Fahrenheit is the same as the temperature in degrees Celsius?		2014-07-27 06:14:11.701624	2014-07-27 06:15:41.001288	a,b) attached\r\nc) F = 45/25C + 32\r\nd) attached\r\ne) attached, F = 9/5C + 32 ->  F - 32 = 9/5C  ->  C = 5/9F - (32*5)/9 ->  C = 5/9F - 17.777->\r\nf) Yes, the corresponding would be about 75, which would be possible on New Year's Day\r\ng) 100 and 0\r\n(212*5)/8  - 17.7 = 100,  (32*5)/9 - 17.77 = 0\r\nh) Yes, the two are the same at -40, where the points intersect on the graph	\N	PBL_ans_29_6.PNG
270	7	29	A recent CNN poll about crime in schools reported that 67% of Americans approved of a bill being debated in Congress. The CNN report acknowledged a 3% margin of error.\r\n(a) Make a number-line graph of the range of approval ratings in this report.\r\n(b) Explain why the range of approval ratings can be described by |x − 0.67| ≤ 0.03.		2014-07-27 06:20:03.256679	2014-07-27 06:20:03.256679	a) ----*====|====|====X====|====|====*----|\r\n      64   65   66   67   68   69   70    71\r\n\r\nb)  |x − 0.67| ≤ 0.03  describes a range of values that is within 0.03 of .67 both above and below.	\N	\N
311	2	33	Write (x + 1)(x + 2) without parentheses. Explain how the diagram at right illustrates this product.		2014-07-29 16:13:03.346169	2014-07-29 16:13:03.346169	x*2 + 3x + 2\r\n\r\nThe diagram illustrates the product because it contains one box that is x each way, or x^2, three boxes that are 1 each way and x the other, or 3x, and two boxes that are 1 by 1, or 2 total.	PBL_graph_33_1.PNG	\N
271	8	29	Translate the sentence “the distance between x and 12 is 20” into an equation using algebraic symbols. What are the values of x being described?		2014-07-27 06:21:32.970987	2014-07-27 06:40:59.158576	|x - 12| = 20\r\nx could be either 32 or -8.	\N	\N
312	3	33	Solve the equation C = 5/9 (F − 32) for F.		2014-07-29 16:16:12.520807	2014-07-29 16:16:12.520807	C = 5/9 (F − 32)\r\n9C = 5F - 160\r\nC = 5F/9 - 160/9	\N	\N
272	9	29	The solution of |x| = 6 consists of the points 6 and −6. Show how to use a test point on the number line to solve and graph the inequality |x| ≤ 6. Do the same for |x| ≥ 6.		2014-07-27 06:22:23.044189	2014-07-27 06:30:20.191701	a) |x| ≤ 6   test point 0 works as 0 is less than 6, same for test points -5 and 5\r\n ----|----*====|====|====|====|====|====|====|====|====|====|====|====*----|----\r\n    -7   -6   -5   -4   -3   -2   -1    0    1    2    3    4    5    6    7\r\n\r\na) |x| ≥ 6    test point 0 doesn't work as 0 is less than 6, same for test points -5 and 5\r\n ====|====*----|----|----|----|----|----|----|----|----|----|----|----*====|====\r\n    -7   -6   -5   -4   -3   -2   -1    0    1    2    3    4    5    6    7       	\N	\N
273	10	29	Translate “x is 12 units from 20” into an equation. What are the values of x being described?		2014-07-27 06:33:08.839199	2014-07-27 06:37:54.756146	|x - 20| = 12\r\n(8, 32)\r\n	\N	\N
274	1	30	Twelve flags are evenly spaced around a running track. Ryan started running at the first flag and took 30 seconds to reach the sixth flag. How many seconds did it take Ryan, running at a constant rate, to reach (a) the 10th flag for the first time? \r\n(b) the 8th flag for the 2nd time? \r\n(c) the nth flag for the mth time?		2014-07-27 06:46:55.670246	2014-07-27 06:46:55.670246	6 seconds per flag, there are 11 equally spaced pieces between the 12 flags, so 1 lap takes 66 seconds.\r\na) 54 seconds\r\nb) 114 seconds\r\nc) (m-1)66 + (n*6)\r\n	\N	\N
275	2	30	Translate the sentence “x and y are twelve units apart” into algebraic code. Find a pair (x; y) that fits this description. How many pairs are there?		2014-07-27 15:58:19.327763	2014-07-27 15:58:19.327763	|x - y| = 12\r\n-7, 5\r\nAn infinite number of pairs.	\N	\N
276	3	30	The equation |x − 7| = 2 is a translation of “the distance from x to 7 is 2.”\r\n(a) Translate |x − 7| ≤ 2 into English, and graph its solutions on a number line.\r\n(b) Convert “the distance from −5 to x is at most 3” into symbolic form, and solve it.		2014-07-27 16:08:17.780739	2014-07-27 16:08:17.780739	a) 'The distance from x to 7 is less than or equal to 2.\r\n\r\n--*====|====|====|====*----|----\r\n  5    6    7    8    9   10\r\n\r\nb) |-5 - x| ≤ 3 \r\n-8 ≤ x ≤ -2\r\n\r\n--*====|====|====|====|====|====|----|----|----\r\n -8   -7   -6   -5   -4   -3   -2   -1    o	\N	\N
277	4	30	In class, Evan read −75 < 2 as “negative 75 is less than 2.” Neva responded by saying “I’m thinking that −75 is a larger number than 2.” How would you resolve this apparent conflict?		2014-07-27 16:41:39.865849	2014-07-27 16:41:39.865849	-75 it to the left of 2 on the number line, which makes it less. However, its magnitude, or absolute value, is 75, which of course is greater than 2.	\N	\N
278	5	30	Verify that (0, 4) is on the line 3x+2y = 8. Find another point on this line. Use these points to calculate the slope of the line. Is there another way to find the slope of the line?		2014-07-27 16:46:30.655056	2014-07-27 16:46:30.655056	3x+2y = 8\r\n3*0 + 2*4 = 8 is true, so (0, 4) is on the line.\r\n(8/3, 0) is also on the line.\r\nThe slope would be (-4/(8/3)) or -12/8 or -3/2.\r\nAnother way to find the slope is to put the equation into y = mx + b form.\r\n2y = -3x + 8\r\ny = -3/2x + 4	\N	\N
279	6	30	Graph a horizontal line through the point (3; 5). Choose another point on this line. \r\nWhat is the slope of this line? \r\nWhat is the y-intercept of this line? \r\nWhat is an equation for this line? \r\nDescribe a context that could be modeled by this line.		2014-07-27 16:52:30.121817	2014-07-27 16:52:30.121817	(0, 5) is on the line.\r\nThe slope is 0.\r\nThe y intercept is 5.\r\nThe equation is y = 0*x + 5 or just y = 5.\r\nIf a bike's odometer reads 5 and is left in the garage (i.e. speed/slope is 0) it will continue to read 5 no matter how much time passes.	\N	PBL_ans_30_6.PNG
280	7	30	Graph a vertical line through the point (3; 5). Does this line have a slope or y-intercept?\r\nWhat is an equation for this line? Describe a context that could be modeled by this line.		2014-07-27 16:57:48.769733	2014-07-27 16:57:48.769733	The slope is infinite and the line never intercepts the y axis.\r\nx = 3.\r\nA bunch of vehicles of different speeds will all have traveled the same distance (0) if no time is allowed to elapse.\r\n	\N	\N
281	8	30	After successfully solving an absolute-value problem, Ariel spilled Heath Bar Crunch R ⃝ all over the problem. All that can be read now is, “The distance between x and (mess of ice cream) is (another mess of ice cream).” Given that Ariel’s answers are x = −3 and x = 7, reconstruct the missing parts of the problem.		2014-07-27 17:01:28.821117	2014-07-27 17:01:28.821117	Given that the total distance between -3 and 7 is 10, we need a number 5 away from each. That would be 2, so the answer is 'the distance between x and 2 is 5'.	\N	\N
282	9	30	The figure shows the graph of 20x + 40y = 1200. Find the x- and y-intercepts, the slope of the line, and the distances between tick marks on the axes. Duplicate this figure on your calculator. What window settings did you use?		2014-07-27 17:41:17.847093	2014-07-27 17:41:17.847093	20x + 40y = 1200\r\n40y = -20x + 1200\r\ny = -1/2x + 30\r\ny intercept is 30 (1200/40)\r\nx intercept is 60 (1200/20)\r\nslope is -1/2.\r\nThe y tick marks are 10 apart.\r\nThe x tick marks are 5 apart.\r\nSee attached	PBL_30_9.PNG	PBL_ans30_9.PNG
283	10	30	The average of three different positive integers is 8.\r\nWhat is the largest integer that could be one of them?		2014-07-27 17:43:28.175437	2014-07-27 17:43:28.175437	Since the integers are positive, the smallest possible values for the other two would be 1. To get an average of 8 for 3 integers, the sum of the 3 must be 24. Take away the two 1s, and the largest possible third number would be 22.	\N	\N
284	11	30	A handicapped-access ramp starts at ground level and rises 27 inches over a distance of 30 feet. What is the slope of this ramp?		2014-07-27 17:46:20.001026	2014-07-27 17:46:20.001026	30 feet times 12 is 360 inches.\r\nThe ramp rises 27/360 per inch, so the slope is 0.075.\r\nWe could also do this as 2.25 feet over 30 feet, 2.25/30, which yields the same answer.	\N	\N
285	12	30	Jay thinks that the inequality k < 3 implies the inequality k^2 < 9, but Val thinks otherwise. Who is right, and why?		2014-07-27 17:50:37.55737	2014-07-27 17:50:37.55737	Jay is not right. k^2 is the same as k*k, thus if k < 3, it should be so that k*k < 3*3. But when k is -4, k*k is 16, which is not less than 9.\r\n	\N	\N
286	1	31	The specifications for machining a piece of metal state that it must be 12 cm long,  within a 0.01-cm tolerance. What is the longest the piece is allowed to be? What is the shortest? \r\nUsing l to represent the length of the finished piece of metal, write an absolute value inequality that states these conditions.		2014-07-27 17:53:23.674237	2014-07-27 17:53:23.674237	The longest is 12.01 cm.\r\nThe shortest is 11.99 cm.\r\n11.99 <= l <= 12.01.	\N	\N
287	2	31	A movie theater charges $6 for each adult and $3 for each child. If the total amount in ticket revenue one evening was $1428 and if there were 56 more children than adults, then how many children attended?		2014-07-28 00:26:26.045189	2014-07-28 00:26:26.045189	6a + 3(a+56) = 1428\r\n9a + 168 = 1428\r\n0a = 1260\r\na = 140 adults attended, and 196 children attended\r\n\r\ncheck: 140*6 + 196*3 = 1428	\N	\N
313	4	33	Draw the line through the point (0; 6) whose slope is 2/3. If you move 24 units to the right of (0; 6), and then move up to the line, what is the y-coordinate of the point you reach?		2014-07-29 16:24:12.194892	2014-07-29 16:24:12.194892	The point would have an x coordinate of 24. The line equation is y = 2x/3 + 6. Solving for x = 24,  y = 48/3 + 6, or 22.	\N	PBL_ans_33_4.PNG
314	5	33	(Continuation) Find an equation for the line. What is the x-intercept of the line?		2014-07-29 16:30:40.580451	2014-07-29 16:30:40.580451	Equation is y = 2x/3 + 6\r\nx intercept is -9\r\n	\N	\N
288	3	31	Pat and Kim are operating a handcar on the railroad tracks. It is hard work, and it takes an hour to cover each mile. Their big adventure starts at 8 am at Rockingham Junction, north of Exeter. They reach the Main St crossing in Exeter at noon, and finish their ride in Kingston at 3 pm. Let t be the number of hours since the trip began, and d be the corresponding distance (in miles) between the handcar and Main St. With t on the horizontal axis, draw a graph of d versus t, after first making a table of (t; d) pairs for 0 ≤ t ≤ 7.		2014-07-28 00:36:22.321552	2014-07-28 00:36:22.321552	\r\ntime     | 8 | 9 | 10 | 11 | 12 |  1 |  2 |  3 |\r\ndistance | 0 | 1 |  2 |  3 |  4 |  5 |  6 |  7 |	PBL_graph_31_3.PNG	PBL_ans_31_3.PNG
289	4	31	(Continuation) Graph the equation y = |x − 4| for 0 ≤ x ≤ 7. Interpret this graph in the current context. 		2014-07-28 00:38:28.880348	2014-07-28 01:13:24.254903	y    | 4 | 3 |  2 |  1 |  0 |  1 |  2 |  3 |\r\nx    | 0 | 1 |  2 |  3 |  4 |  5 |  6 |  7 |\r\n\r\nAt noon the time resets back to 0 and then begins counting up again.	\N	PBL_ans_31_4.PNG
290	5	31	(Continuation) Let y be the distance between the handcar and the Newfields Road bridge, which Pat and Kim reach at 11 am. Draw a graph that plots y versus t, for the entire interval 0 ≤ t ≤ 7. Write an equation that expresses y in terms of t. By the way, you have probably noticed that each of these absolute-value graphs has a corner point, which is called a 'vertex'.		2014-07-28 01:34:09.399904	2014-07-28 01:34:09.399904	t   0   1   2   3   4   5   6   7\r\ny   3   2   1   0   1   2   3   4\r\n\r\ny = {3 - t|	\N	PBL_ans_31_5.PNG
291	6	31	(Continuation) Solve the equation |t − 3| = 1 and interpret the answers		2014-07-28 01:37:35.811235	2014-07-28 01:37:35.811235	t - 3 = 1 or t - 3 = -1\r\nt = 4 or t = 2\r\n\r\n2 and 4 are both 1 unit from 3.	\N	\N
292	7	31	If |x + 1| = 5, then x + 1 can have two possible values, 5 and −5. This leads to two equations, x + 1 = 5 and x + 1 = −5. If |2x − 7| = 5, what possible values could the expression 2x − 7 have? Write two equations using the expression 2x − 7 and solve them.		2014-07-28 01:41:29.264255	2014-07-28 01:41:29.264255	2x - 7 could equal 5 or -5\r\n2x - 7 = 5\r\n2x = 2\r\nx = 1\r\n\r\n2x - 7 = -5\r\n2x = 12\r\nx = 6\r\n\r\ncheck: 	\N	\N
293	8	31	Write two equations without absolute value symbols that, in combination, are equivalent to |3x + 5| = 12. Solve each of these two equations.		2014-07-28 01:43:58.752243	2014-07-28 01:43:58.752243	3x + 5 = 12\r\n3x = 7\r\nx = 7/3\r\n\r\n3x + 5 = -12\r\n3x = -17\r\nx = -17/3\r\n\r\ncheck: 3(7/3) + 5 = 12,  3(-17/3) + 5 = 12	\N	\N
294	9	31	Given that 0.0001 ≤ n ≤ 0.01 and 0.001 ≤ d ≤ 0.1, what are the largest and smallest values that nd can possibly have? Write your answer smallest ≤ nd ≤ largest		2014-07-28 02:03:12.543705	2014-07-28 02:03:12.543705	smallest is .0001/.1 or .001\r\nlargest is .01/.001 or 10	\N	\N
295	10	31	A 'lattice point' is defined as a point whose coordinates are integers. If (−3; 5) and (2; 1) are two points on a line, find three other lattice points on the same line.		2014-07-28 02:13:40.950086	2014-07-28 02:13:40.950086	slope is -4/5,\r\n-8,9\r\n7,-3\r\n12,-7\r\n	\N	PBL_ans_31_10.PNG
296	11	31	The equation 13x + 8y = 128 expresses a linear relationship between x and y. The point (5; 8) is on, or above, or below the linear graph. Which is it? How do you know?		2014-07-28 02:16:32.537477	2014-07-28 02:16:32.537477	13x + 8y = 128\r\n13x + 64 = 128\r\n13x = 64 \r\nx = 4.923 is on the line, thus 5 is slightly above the line.\r\n	\N	\N
297	1	32	Show that the equation y = (7/3)x − 11/8 can be rewritten in the standard form ax+by = c, in which a, b, and c are all integers. 		2014-07-28 02:20:51.587962	2014-07-28 02:20:51.587962	y = (7/3)x − 11/8\r\n-(7/3)x + y = -11/8\r\n-(56/3)x + 8y = -11\r\n-56x + 24y = -33	\N	\N
298	2	32	Fill in the blanks:\r\n(a) The inequality |x − 1.96| < 1.04 is equivalent to “x is between and .”\r\n(b) The inequality |x−2.45| ≥ 4.50 is equivalent to “x is not between and .”		2014-07-28 22:52:00.480048	2014-07-28 22:52:00.480048	a) x is between .92 and 3\r\nb) x is not between -2.05 and 6.95	\N	\N
299	3	32	Find the value for h for which the slope of the line through (−5; 6) and (h; 12) is 3/4.		2014-07-28 23:07:30.247756	2014-07-28 23:07:30.247756	(12-6)/(h+5) = 3/4\r\n6 = 3/4(h + 5)\r\n24 = 3h + 15\r\n3h = 9\r\nh = 3\r\n\r\ncheck: slope would be (12-6)/(3-(-5)) -> 6/8  ->  3/4	\N	\N
300	4	32	Solve the equation 0.05x + 0.25(30 − x) = 4.90. Invent a context for the equation.		2014-07-28 23:20:09.228252	2014-07-28 23:20:09.228252	0.05x + 0.25(30 − x) = 4.90\r\n5x + 25(30 - x) = 490\r\n5x - 25x + 750 = 490\r\n20x = 260\r\nx = 13\r\n\r\ncheck:  65 + 25*(17) = 490  ->  490 = 490\r\nYou had to sell raffle tickets. You put in 5 cents for each raffle ticket you sold, but if you sold less than 30 you had to pay an extra 25 cents for each ticket less than 30. Since you sold only 13 you had to pay a 4.25 penalty.	\N	\N
301	5	32	The data in each table fits a direct variation. Complete each table, write an equation to model its data, and sketch a graph.		2014-07-29 00:06:18.081293	2014-07-29 00:06:18.081293	x  2  4  6  12         y = 3/2x\r\ny  3  6  9  18\r\n\r\nx  2   3   5   8       y = -4x \r\ny -8 -12 -20 -32	PBL_graph_32_5.PNG	PBL_ans_32_5.PNG
302	6	32	For each of the following equations, find the x-intercept and y-intercept. Then use them to calculate the slope of the line.\r\n(a) 3x + y = 6 (b) x − 2y = 10 (c) 4x − 5y = 20 (d) ax + by = c		2014-07-29 07:06:53.307764	2014-07-29 07:06:53.307764	(a) 3x + y = 6    -> x intercept= 6    -> y-intercept = 2     -> slope=  -1/3\r\n(b) x − 2y = 10   -> x intercept= -5   -> y-intercept = 10    -> slope=  2\r\n(c) 4x − 5y = 20  -> x intercept= -4   -> y-intercept = 5     -> slope=  5/4\r\n(d) ax + by = c   -> x intercept= c/b  -> y-intercept = c/a   -> slope=  -(c/a)/(c/b)	\N	\N
303	7	32	Blair’s average on the first five in-class tests is 67. If this is not pulled up to at least a 70, Blair will not be allowed to watch any more Law and Order reruns. To avoid losing those TV privileges, what is the lowest score Blair can afford to make on the last in-class test? Assume that all tests carry equal weight.		2014-07-29 07:09:39.809394	2014-07-29 07:09:39.809394	4*67 + t = 5*70\r\nt + 269 = 350\r\nt = 82\r\n\r\n	\N	\N
304	8	32	Sketch the graphs of y = 2x, y = 2x+1, and y = 2x−2 all on the same coordinate-axis system. Find the slope of each line. How are the lines related to one another?		2014-07-29 07:12:56.10938	2014-07-29 07:12:56.10938	graphs attached, they all have the same slope, 2. Only the y intercept is different.	\N	PBL_ans_32_8.PNG
305	9	32	I have 120 cm of framing material to make a picture frame, which will be most pleasing to the eye if its height is 2/3 of its width. What dimensions should I use?		2014-07-29 07:17:21.022868	2014-07-29 07:17:21.022868	Each length plus width will total 60, so we need 2/3 of 60 + w for the height. \r\n(5/3)w = 60\r\n5w =  180\r\nw = 36, h = 24\r\n\r\ncheck= 24/36 = 2/3	\N	\N
306	10	32	Describe the relationship between the following pairs of numbers:\r\n(a) 24 − 11 and 11 − 24 (b) x − 7 and 7 − x (c) |x − 7| and |7 − x|		2014-07-29 07:20:35.490533	2014-07-29 07:20:35.490533	(a) 24 − 11 and 11 − 24   ->  they are equally far away from 0 on opposite sides of the number line\r\n(b) x − 7 and 7 − x       ->  they are equally far away from 0 on opposite sides of the number line\r\n(c) |x − 7| and |7 − x|   ->  they are equal and non negative	\N	\N
307	11	32	In each case, decide whether the three points given are collinear:\r\n(a) (−4; 8), (0; 2), and (2;−1) (b) (350; 125), (500; 300), and (650; 550)		2014-07-29 07:28:40.628334	2014-07-29 07:28:40.628334	(a) (−4; 8), (0; 2), and (2;−1)    yes, since the slope is -3/2 between each pair\r\n(b) (350; 125), (500; 300), and (650; 550)  no, the slope between the first two pairs is 1.1667, between the second two is 1.667 and between the first and last is 1.41667	\N	\N
315	6	33	Sketch on the same axes the graphs of y = |x| and y = |x| − 2. Label the x- and y-intercepts. In what respects are the two graphs similar? In what respects do they differ?		2014-07-29 16:34:36.962457	2014-07-29 16:34:36.962457	The two graphs have the same shape, but the second one is shifted two units down the y axis.	\N	PBL_ans_33_6.PNG
316	7	33	The manager at Jen and Berry’s Ice Cream Company estimates that the cost C (in dollars) of producing n quarts of ice cream in a given week is given by the equation C = 560 + 1.20n.\r\n(a) During one week, the total cost of making ice cream was $1070. How many quarts were made that week?\r\n(b) Explain the meanings of the “560” and the “1.20” in the cost equation.		2014-07-29 16:39:00.717598	2014-07-29 16:39:00.717598	a) 1070 = 560 + 1.20n  ->  1.2n = 510  ->  n = 425 quarts were made\r\nb) 560 is the fixed cost, presumably of the labor, etc. 1.20 is a cost that varies with the amount made, presumably of the needed materials.	\N	\N
317	8	33	As anyone knows who has hiked up a mountain, the higher you go, the cooler the temperature gets. At noon on July 4th last summer, the temperature at the top of Mt. Washington—elevation 6288 feet—was 56◦F. The temperature at base camp in Pinkham Notch — elevation 2041 feet — was 87◦F. It was a clear, still day. At that moment, a group of hikers reached Tuckerman Junction — elevation 5376 feet. To the nearest degree, calculate the temperature the hikers were experiencing at that time and place. When you decided how to model this situation, what assumptions did you make?	Great problem.	2014-07-29 20:26:12.471885	2014-07-29 20:26:12.471885	Change in temperature-  87-56, or 31 degrees cooler\r\nChange in altitude-   6288-2041, or 4247 feet difference\r\n4247/31 means the temperature goes down about 1 degree for each additional 137 feet of elevation.  \r\nTuckerman Junction is 5376-2041 feet above Pinkham Notch, or 3335 feet of additional altitude. 3335/137 would subtract about 24.3 degrees from the base temp of 87, making it about 63 degrees at Tuckerman.\r\nThis assumes that the decrease in temperature is constant as altitude increases, which probably isn't the case, since the local recorded temperature can be affected by many factors including wind and amount of sunshine.	\N	\N
318	9	33	Draw a line through the origin with a slope of 0.4. Draw a line through the point (1, 2) with a slope of 0.4. How are these two lines related? What is the vertical distance between the two lines? Find an equation for each line.		2014-07-29 20:33:33.733742	2014-07-29 20:33:33.733742	Graph attached. The two lines are parallel, The vertical distance between the two lines is 1.6.\r\n\r\ny = 4x/10\r\ny = 4x/10 + 1.6	\N	PBL_ans_33_9.PNG
319	10	33	Graph y = |x| + 3 and y = |x| − 5, then describe in general terms how the graph of y = |x| is transformed to produce the graph of y = |x| + k. How can you tell from the graph whether k is positive or negative?		2014-07-29 20:38:00.890212	2014-07-29 20:38:00.890212	The graph moves up k units if k is positive, or down k units if k is negative. So you can tell the sign of k by checking whether the vertex is above or below the x axis.	\N	PBL_ans_33_10.PNG
320	11	33	Randy phones Sandy about a homework question, and asks, “The vertex of the graph of y equals the absolute value of x plus four is (−4; 0), isn’t it?” Sandy answers, “No, the vertex is (0; 4).” Who is right? Explain.		2014-07-29 20:42:40.218635	2014-07-29 20:42:40.218635	It depends on how the question is interpreted. If it is |x + 4|, the vertex is at (-4, 0). If it is |x| + 4, the vertex is (0, 4).	\N	\N
321	1	34	Solve 3m/4 + 3/8 = m/3 − 5/6 for m, expressing your answer as a fraction in lowest terms.		2014-07-29 20:52:51.49007	2014-07-29 20:52:51.49007	3m/4 + 3/8 = m/3 − 5/6\r\n18m/24 + 9/24 = 8m/24 - 20/24\r\n10m/24 = -29/24\r\n10m = -29\r\nm = -29/10\r\n\r\ncheck: -87/10/4 + 3/8 = -29/10/3 - 5/6\r\n-522/10 + 9 = -232/10 - 20\r\n-290/10 = -29\r\n29 = 29	\N	\N
322	2	34	Find two different ways of determining the slope of the line 11x + 8y = 176.		2014-07-29 20:57:08.44874	2014-07-29 20:57:08.44874	1) convert to y = mx + b form. \r\n8y = -11x + 176\r\ny = -11x/8 + 22, slope is -11/8\r\n\r\n2) y intercept is 22, making (0,22) a point on the line\r\n   x intercept is 16, making (16,0) a point on the line\r\nslope becomes -22/16 or -11/8	\N	\N
323	3	34	Find the x- and y-intercepts of y = |x − 3| − 5, find the coordinates of its vertex, and then sketch the graph of this equation.		2014-07-29 21:21:05.622447	2014-07-29 21:21:05.622447	y = |x − 3| − 5\r\ny intercept ->  y = |-3| - 5 or -2\r\nx intercept ->  |x - 3| = 5, x intercepts are 8 and -2.\r\nThe vertex is at ( 3, -5 )\r\n\r\n	\N	\N
324	4	34	When weights are placed on the end of a spring, the spring stretches. If a three-pound weight stretches the spring to a length of 4.25 inches, a five-pound weight stretches the spring to a length of 5.75 inches, and a nine-pound weight stretches the spring to a length of 8.75 inches, what was the initial length of the spring?		2014-07-29 21:47:14.014954	2014-07-29 21:47:14.014954	5-3 or 2 pounds stretches it 5.75 - 4.25 = 1.5 inches or .75 inches per pound.\r\n9-5 or 4 pounds stretches it 8.75 - 5.75 = 3 inches, or again .75 inches per pound, so it appears to be a direct relationship between weight and stretch.\r\n0-3 would be 3 * .75 or 2.25 inches of stretch, so with 0 pounds the spring would be at 4.25-2.25 or 2 inches long.\r\n\r\ncheck: 2 + 9*.75 = 8.75	\N	\N
325	5	34	Given that y varies directly with x and that y = 60 when x = 20, find y when x = 12.		2014-07-29 21:49:08.253441	2014-07-29 21:49:08.253441	60/20 = y/12\r\n720/20 = y\r\ny = 36	\N	\N
326	6	34	Draw rectangles that are composed of x2-blocks, x-blocks, and 1-blocks to illustrate the results when the following binomial products are expanded:\r\n(a) (x + 2)(x + 3) (b) (2x + 1)(x + 1) (c) (x + 2)(x + 2)		2014-07-29 21:52:24.580177	2014-07-29 22:10:49.039541	(a) (x + 2)(x + 3)  ->  x^2 + 5x + 6\r\n   XXXXXXXXXXXXX\r\n   X     | | | X     \r\n x X     | | | X\r\n   X     | | | X   \r\n   X-----------X \r\n 1 X     | | | X\r\n   X-----------X\r\n 1 X     | | | X\r\n   XXXXXXXXXXXXX\r\n     x    1 1 1\r\n(b) (2x + 1)(x + 1)  ->  2x^2 + 3x + 1\r\n   XXXXXXXXX\r\n   X     | X     \r\n x X     | X\r\n   X     | X   \r\n   X-------X \r\n   X     | X   \r\n x X     | X\r\n   X     | X   \r\n   X-------X\r\n 1 X     | X\r\n   XXXXXXXXX\r\n      x   1 \r\n(c) (x + 2)(x + 2) ->  x^2 + 4x + 4\r\n   XXXXXXXXXXX\r\n   X     | | X     \r\n x X     | | X\r\n   X     | | X   \r\n   X---------X \r\n 1 X     | | X\r\n   X---------X\r\n 1 X     | | X\r\n   XXXXXXXXXXX\r\n     x    1 1	\N	\N
327	7	34	Solve for x: 1/2 (x − 2) + 1/3 (x − 3) + 1/4 (x − 4) = 10		2014-07-29 22:18:23.675789	2014-07-29 22:18:23.675789	 1/2 (x − 2) + 1/3 (x − 3) + 1/4 (x − 4) = 10\r\n 6/12 (x − 2) + 4/12 (x − 3) + 3/12 (x − 4) = 10\r\n 6(x − 2) + 4(x − 3) + 3(x − 4) = 120\r\n6x - 12 + 4x - 12 + 3x - 12 = 120\r\n13x - 36 = 120\r\n13x = 156\r\nx = 12\r\n\r\ncheck: 1/2(10) + 1/3(9) + 1/4(8) = 5 + 3 + 2 = 10	\N	\N
328	8	34	Sketch on the same axes the graphs of\r\n(a) y = |x| (b) y = 2|x| (c) y = 0:5|x| (d) y = −3|x|		2014-07-29 22:22:32.142635	2014-07-29 22:22:32.142635	attached, the number in front of the absolute value part becomes the slope of the line, negative on one side and positive on the other.	\N	PBL_ans_34_8.PNG
329	9	34	What effect does the coefficient a have on the graph of the equation y = a|x|? How can you tell whether a is positive or negative by looking at the graph?		2014-07-29 22:24:34.835325	2014-07-29 22:24:34.835325	A larger a makes for a steeper/narrower vee, and a smaller a makes for a wider one.\r\nIf the legs point up the value of a will be positive, and if they point down, negative.	\N	\N
330	10	34	Find the x- and y-intercepts of y = 5 − |x − 3|, find the coordinates of its vertex, and then sketch the graph of this equation.		2014-07-29 22:29:14.885211	2014-07-29 22:29:14.885211	y = 5 − |x − 3|\r\ny intercept = 2\r\nx intercepts are 8 and -2\r\nvertex is at (3, 5)\r\n	\N	PBL_ans_34_10.PNG
331	11	34	A chemist would like to dilute a 90-cc solution that is 5% acid to one that is 3% acid. How much water must be added to accomplish this task?		2014-07-29 22:36:05.195262	2014-07-29 22:36:05.195262	5*90 = 3s\r\n450 = 3s\r\ns = 150\r\n150-90 or 60 cc's must be added\r\n\r\ncheck: the original solution has .05*90 or 4.5 cc of acid in it. That won't change, so 4.5/150 = .03 or 3%\r\n	\N	\N
332	12	34	A cube measures x cm on each edge.\r\n(a) Find a formula in terms of x for the volume of this cube in cubic centimeters (cc).\r\n(b) Evaluate this formula when x = 1:5 cm; when x = 10 cm.\r\n(c) Write an expression for the area of one of the faces of the cube. Write a formula for the total surface area of all six faces.\r\n(d) Evaluate this formula when x = 1:5 cm; when x = 10 cm.\r\n(e) Although area is measured in square units and volume in cubic units, is there any cube for which the number of square units in the area of its faces would equal the number of cubic units in the volume?		2014-07-29 22:42:42.561036	2014-07-29 22:42:42.561036	a) volume of the cube is x * x * x or x^3\r\nb) 1.5^3 = 1.5*1.5*1.5 = 3.375 cc,  10^3 = 10*10*10 or 1000 cc\r\nc) x^2 for one side, 6x^2 for the total surface area\r\nd) 1.5^2 * 6 = 13.5 sq. cm,  10*10*6 = 600 sq. cm\r\ne) x*x*x = 6*x*x, a 6x6x6 cube would have a volume and surface area of 216 units\r\n	\N	\N
333	13	34	Apply the distributive property to write without parentheses and collect like terms: \r\n(a) x(x − 3) + 2(x − 3) (b) 2x(x − 4) − 3(x − 4) (c) x(x − 2) + 2(x − 2)		2014-07-29 22:49:03.184797	2014-07-29 22:49:03.184797	(a) x(x − 3) + 2(x − 3)   ->   x^2 - 3x + 2x - 6    ->   x^2 - x - 6\r\n(b) 2x(x − 4) − 3(x − 4)  ->   2x^2 - 8x - 3x + 12  ->   2x^2 - 11x + 12\r\n(c) x(x − 2) + 2(x − 2)   ->   x^2 - 2x + 2x - 4    ->   x^2 - 4	\N	\N
334	1	35	The fuel efficiency of a car depends on the speed at which it is driven. For example, consider Kit’s Volvo. When it is driven at r miles per hour, it gets m = 32 − 0:2|r − 55| miles per gallon. Graph m versus r, for 0 < r ≤ 80. Notice that this graph has a vertex. What are its coordinates?		2014-07-29 22:53:47.203846	2014-07-29 22:53:47.203846	m = 32 − 0:2|r − 55|\r\n\r\nThe coordinates of the vertex are (55,32)	\N	PBL_ans_35_1.PNG
335	2	35	(Continuation) Solve the inequality 30 ≤ 32 − 0.2|r − 55|, and express the solution interval graphically. What is the meaning of these r-values to Kit?		2014-07-29 23:02:41.660924	2014-07-29 23:02:41.660924	30 ≤ 32 − 0.2|r − 55|\r\n-2 ≤ -0.2|r − 55|\r\n0.2|r − 55| ≤ 2\r\n|r − 55| ≤ 10\r\nr - 55 ≤ 10     or    r - 55 ≤  -10\r\n45 ≤ r ≤ 65\r\n\r\nThe car achieves an r value greater than 30 when it travels between 45 and 65 mph.\r\n	\N	PBL_ans_35_2.PNG
336	3	35	Asked to solve the inequality 3 < |x−5| at the board, Corey wrote “8 < x < 2,” Sasha wrote “x < 2 or 8 < x,” and Avery wrote “x < 2 and 8 < x.” What do you think of these answers? Do any of them agree with your answer?		2014-07-29 23:07:56.868328	2014-07-29 23:07:56.868328	3 < |x−5|   ->   3 < x - 5    -3 > x - 5    so x > 8 or x < 2\r\nCorey's answer isn't correct as it includes 5, 3 is not less than 0\r\nSasha's answer is correct as x must either be less than 2 or greater than 8.\r\nAvery's answer isn't correct as a number can't be both less than 2 and greater than 8 at the same time.	\N	\N
337	4	35	Apply the distributive property to write without parentheses and collect like terms:\r\n(a) (x + 2)(x − 3) (b) (2x − 3)(x − 4) (c) (x + 2)(x − 2)		2014-07-30 18:01:29.744141	2014-07-30 18:01:29.744141	(a) (x + 2)(x − 3)   -> x^2 - x - 6\r\n(b) (2x − 3)(x − 4)  -> 2x^2 -7x + 12\r\n(c) (x + 2)(x − 2)   -> x^2 - 4	\N	\N
338	5	35	If the width and length of a rectangle are both increased by 10%, by what percent does the area of the rectangle increase? By what percent does the perimeter of the rectangle increase?		2014-07-31 16:17:06.60001	2014-07-31 16:17:06.60001	The area increases by 21%, 1.0x*1.0x becomes 1.1x*1.1x, or 1.21x instead of 1.00x.\r\nThe perimeter increases by 10%, since if it was 1.0x on a side perimeter would be 4.0x, 1.1x on a side would be 4.4x	\N	\N
342	9	35	A 20-mile road runs between Buzzardtown and Dry Gulch. Each town has a gas station, but there are no gas stations between the towns. Let x be the distance from Buzzardtown, measured along the road (so 0 ≤ x ≤ 20), and y be the distance to the nearest gas station. Make a table of values that includes entries for x = 7, x = 9, and x = 16, and then draw a graph of y versus x. The graph should have a vertex at (10; 10).		2014-08-01 00:07:15.872341	2014-08-01 00:08:19.16334	x   0   7   9  16  20\r\ny   0   7   9   4   0\r\n\r\n	\N	PBL_ans_35_9.PNG
339	6	35	By rearranging the two parts of the diagram shown at right, you can demonstrate that x2 − 4 is equivalent to (x + 2)(x − 2) without using the distributive property. Show how to do it.		2014-07-31 16:35:47.54415	2014-07-31 22:52:35.288767	  XXXXXXX   Take the small rectangle to the right, which is 2 wide, rotate it 90 degrees and put it on the top.\r\n2 X     X   Now the vertical column is x - 2 and the horizontal pieces are x + 2.\r\n  X-----X\r\n  X     X\r\n  X.....X\r\nx X     X\r\n  X     X\r\n  X     X\r\n  XXXXXXX\r\n    x-2 	PBL_graph_35_6.PNG	\N
340	7	35	Compare the graphs of y = x − 3 and y = |x − 3|. How are they related?		2014-07-31 23:53:53.640979	2014-07-31 23:53:53.640979	On the positive side of the y intercept the two graphs are the same. On the negative side the second equation has the same slope only negative.	\N	\N
341	8	35	Morgan’s way to solve the equation |2x−7| = 5 is to first write |x−3.5| = 2.5. Explain this approach, then finish the job.		2014-07-31 23:57:14.447378	2014-07-31 23:57:14.447378	Morgan divides both sides by 2 so that the equation can be solved for just x.\r\n|x−3.5| = 2.5\r\nx - 3.5 = 2.5 or x−3.5 = -2.5\r\nx = 6 or x = 1\r\n\r\ncheck: 2*6 - 7 = 12 - 7 = 5\r\n       2*1 - 7 = 2 - 7 = -5	\N	\N
345	12	35	A train is leaving in 11 minutes and you are one mile from the station. Assuming you can walk at 4 mph and run at 8 mph, how much time can you afford to walk before you must begin to run in order to catch the train?		2014-08-01 01:06:41.122072	2014-08-01 01:06:41.122072	4t + 8(11-t) = 60\r\n-4t + 88 = 60\r\n-4t = -28\r\nt = 7 minutes\r\n\r\nCheck: 7*4/60 + 4 * 8/60 = .467   + .533 = 1 mile	\N	\N
343	10	35	(Continuation) Graph the equation y = 10 − |x − 10|. Explain its significance to the story.		2014-08-01 00:14:08.532294	2014-08-01 00:14:08.532294	At no point are you more than 10 miles from a gas station. If you are closer to Buzzardtown your distance is 10 + x - 10 or just x. But if you are closer to Dry Gulch, your distance is 20 - x, which is the same as 10 -x + 10. The absolute value function captures this relationship.	\N	PBL_ans_35_10.PNG
344	11	35	(Continuation) Suppose that you are in a car that has been traveling along the Buzzardtown-Dry Gulch road for t minutes at 30 miles per hour. How far is it to the nearest gas station, in terms of t? Graph this distance versus t. What are the coordinates of the vertex of your graph?		2014-08-01 00:47:58.87806	2014-08-01 00:47:58.87806	It takes 2 minutes to travel 1 mile, so the nearest gas station would be 20 - (t - 20) minutes. Since we're working in minutes, we divide 30/60, to get a speed of 1/2 miles per minute. Thus we have to multiply the previous equation by 1/2 to get the correct distance.\r\nThe final equation is:\r\nd = (20-|t-20)/2	\N	PBL_ans_35_11.PNG
378	2	39	What is the slope of the line graphed at the right, if (a) the distance between the x-tick marks is 2 units and the distance between the y-tick marks is 1 unit?\r\n(b) the distance between the x-tick marks is 100 units and the distance between the y-tick marks is 5 units?	In a x is doubled vs. y, in b x is 20 times y, thus the relationship.	2014-08-02 21:38:30.689558	2014-08-02 21:38:30.689558	a) 5/16\r\nb) 25/800 or 5/160	PBL_graph_39_2.PNG	\N
346	1	36	Sandy was told by a friend that “absolute value makes everything positive.” So Sandy rewrote the equation |x − 6| = 5 as x + 6 = 5. Do you agree with the statement, or with what Sandy did to the equation? Explain your answer.		2014-08-01 01:10:13.47576	2014-08-01 01:10:13.47576	No, absolute value makes the result of what is inside the vertical lines positive, but that doesn't mean that 'everything' is positive, just the result. So even though x + 6 = 5 gives one of the solutions, -1, it loses the other solution, 1, which results when the -5 result of 1-6 is changed to positive.	\N	\N
347	2	36	For each of the following points, find the distance to the y-axis:\r\n(a) (11; 7) (b) (−5; 9) (c) (4; y) (d) (x;−8)		2014-08-01 01:12:44.109728	2014-08-01 01:12:44.109728	a) 11\r\nb) 5\r\nc) 4\r\nd) x	\N	\N
348	3	36	To mail a first-class letter in 2006, the rate was 39 cents for the first ounce or fraction thereof, and 24 cents for each additional ounce or fraction thereof. Let p be the number of cents needed to mail a first-class letter that weighed w ounces. Graph p versus w, after first making a table that includes some non-integer values for w.		2014-08-01 01:34:16.494442	2014-08-01 01:34:16.494442	p = .24*(w-1) + .39\r\np = .24w -.24 + .39\r\np = .24w + .15\r\n\r\nw    1    2    3   3.5    4\r\np  .39  .63  .87  1.05 1.05	\N	PBL_ans_36_3.PNG
349	4	36	Given the line y = 1/2x + 6, write an equation for the line through the origin that has the same slope. Write an equation for the line through (2,−4) that has the same slope.		2014-08-01 01:39:31.323488	2014-08-01 01:39:31.323488	y = 1/2x\r\ny = 1/2x - 5\r\n	\N	PBL_ans_36_4.PNG
350	5	36	The table shows the population of New Hampshire at the start of each of the last six decades.\r\n(a) Write an equation for the line that contains the data points for 1960 and 2010.\r\n(b) Write an equation for the line that contains the data points for 2000 and 2010.\r\n(c) Make a scatter plot of the data. Graph both lines on it.\r\n(d) Use each of these equations to predict the population of New Hampshire at the beginning of 2020. For each prediction, explain why you could expect it to provide an accurate forecast.		2014-08-01 02:31:02.339072	2014-08-01 02:31:02.339072	a) 60,60.5921  and   110, 131.6472, for simplicity, call them 60, 60.6  and 110, 131.6\r\nSlope:  (131.6-60.6)/(110-60)   ->   71/50   ->  1.42\r\n131.6 = 1.42*110 + b  ->  131.6 = 156.2 + b   ->  b = -24.6\r\ny = 1.42x - 24.6\r\nb) 100, 123.8 and 110, 131.6\r\nSlope: (131.6-123.8)/10   ->  7.8/10   ->  .78\r\n131.6 = .78*110 + b  ->  131,6 - 85.8 = b   ->  b = 45.8\r\ny = .78x + 45.8\r\nc) attached\r\nd) first graph, about 1.46 million\r\n   second graph, about 1.4 million\r\nThe first graph takes into account the average change over 50 years, the second only 10 years of change. Either might produce an accurate forecast, depending on whether the slow down in the last decade represents a long term downward trend or is more of a random variation within a larger pattern.\r\n	PBL_graph_36_5.PNG	PBL_ans_36_5.PNG
351	6	36	Which of the following calculator screens could represent the graph of 9x + 5y = 40?		2014-08-01 02:35:29.055104	2014-08-01 02:35:29.055104	The x intercept is 8 and the y intercept is 4.44, so it can't be a or c. In b the y intercept is smaller than the x intercept, while in d the y intercept is about twice the x intercept. Thus d is the answer.\r\n	PBL_graph_36_6.PNG	\N
352	7	36	For each of these absolute-value equations, write two equations without absolute-value symbols that are equivalent to the original. Solve each of the equations.\r\n(a) 2|x + 7| = 12 (b) 3 + |2x + 5| = 17 (c) 6 − |x + 2| = 3 (d) −2|4 − 3x| = −14		2014-08-01 02:42:47.179678	2014-08-01 02:42:47.179678	(a) 2|x + 7| = 12 \r\nx + 7 = 6  or  x + 7 = -6   ->  -1, -13\r\n(b) 3 + |2x + 5| = 17 \r\n2x + 5 = 14  or 2x + 5 = -14   ->   4.5, -9.5\r\n(c) 6 − |x + 2| = 3 \r\nx + 2 = -3 or  x + 2 = 3   ->  -5, 1\r\n(d) −2|4 − 3x| = −14\r\n4 - 3x = 7  or  4 - 3x = -7    ->  -1, 11/3	\N	\N
353	8	36	Hearing Yuri say “This line has no slope,” Tyler responds “Well, ‘no slope’ actually means slope 0.” What are they talking about? Do you agree with either of them?		2014-08-01 02:44:52.926053	2014-08-01 02:44:52.926053	If they are talking about a horizontal line. I would be more accurate to say the slope is 0, since the change in y for a given x is 0. If they are talking about a vertical line, it is fair to say there is no slope, as finding a slope would require dividing by zero.	\N	\N
354	9	36	A flat, rectangular board is built by gluing together a number of square pieces of the same size. The board is m squares wide and n squares long. In terms of m and n, write two different expressions for the number of completely surrounded squares.		2014-08-01 02:47:14.140672	2014-08-01 02:47:14.140672	(m-2)(n-2)\r\n(m*n)-2m-2n+4	\N	\N
356	2	37	Lee’s pocket change consists of x quarters and y dimes. Put a dot on every lattice point (x; y) that signifies that Lee has exactly one dollar of pocket change. What equation describes the line that passes through these points? Notice that it does not make sense to connect the dots in this context, because x and y are discrete variables, whose values are limited to integers.		2014-08-01 03:12:53.785287	2014-08-01 03:13:42.594535	10y + 25x = 100	\N	PBL_ans_37_2.PNG
355	1	37	The edges of a solid cube are 3p cm long. At one corner of the cube, a small cube is cut away. All its edges are p cm long. In terms of p, what is the total surface area of the remaining solid? What is the volume of the remaining solid? Make a sketch.		2014-08-01 02:53:26.937363	2014-08-01 03:17:50.173908	Surface area = 6(9p^2) = 54p^2  It is the same as the full cube because even though 3 faces were removed, 3 new faces were uncovered.\r\nVolume = 27p^3 - p^3, It is the full volume minus the volume of the removed cube.	\N	PBL_ans_37_1.PNG
357	3	37	(Continuation) Put a dot on every lattice point (x, y) that signifies that Lee has at most one dollar in pocket change. How many such dots are there? What is the relationship between Lee’s change situation and the inequality 0.25x + 0.10y ≤ 1.00?		2014-08-01 03:25:57.778946	2014-08-01 03:25:57.778946	1 q, 0 dimes through 1 q 7 dimes, 2 q, 0 through 5 dimes, etc.\r\nI count 29 dots. \r\nAll the dots are below the line that would be formed by connecting the original lattice points that came out equal to one dollar.	\N	PBL_ans_37_3.PNG
358	4	37	(Continuation) Write two inequalities that stipulate that Lee cannot have fewer than zero quarters or fewer than zero dimes.		2014-08-01 03:27:00.988583	2014-08-01 03:27:00.988583	q >= 0\r\nd >= 0	\N	\N
359	5	37	The figure shows the graphs of two lines. Use the graphs (the axis markings are one unit apart) to estimate the coordinates of the point that belongs to both lines.		2014-08-01 21:50:08.464238	2014-08-01 21:50:08.464238	2.1, 1.4	PBL_ans_37_5.PNG	\N
360	6	37	(Continuation) The 'system of equations' that has been graphed is\r\n{ 9x − 2y = 16\r\n  3x + 2y = 9\r\nJess took one look at these equations and knew right away what to do. “Just add the equations and you will find out quickly what x is.” Follow this advice, and explain why it works.		2014-08-01 21:52:29.003254	2014-08-01 21:58:05.104291	  9x − 2y = 16\r\n  3x + 2y = 9\r\n 12x - 0y = 25\r\n   x = 25/12\r\n\r\nIt works because when the two are added the y variable goes away, making it easy to solve for x.	\N	\N
379	3	39	My sleeping bag is advertised to be suitable for temperatures T between 20 degrees below zero and 20 degrees above zero (Celsius). Write an absolute-value inequality that describes these temperatures T.		2014-08-02 21:39:36.676228	2014-08-02 21:39:36.676228	-20 <= T <= 20	\N	\N
361	7	37	(Continuation) Find the missing y-value by inserting the x-value you found into either of the two original equations. Do the coordinates of the intersection point agree with your estimate? These coordinates are called a 'simultaneous solution' of the original system of equations. Explain the terminology.		2014-08-01 21:57:41.843282	2014-08-01 21:57:41.843282	x = 25/12 or 2.08333, close to my estimate of 2.1\r\n3*25/12 + 2y = 9\r\n75/12 + 2y = 9\r\n75 + 24y = 108\r\n24y = 33\r\ny = 33/24 or 1.375, close to my estimate of 1.4\r\nThis is called a simultaneous solution to both equations because this pair is true for both.\r\n	\N	\N
362	8	37	Using four x-blocks:\r\n(a) Draw a rectangle. Write the dimensions of your rectangle. What is its area?\r\n(b) Draw a rectangle with dimensions different from those you used in part (a).		2014-08-01 22:07:12.353566	2014-08-01 22:07:12.353566	a)  XXXXXXXX|XXXXXXXX  Dimensions, 2x by 2x. Area 4x^2\r\n    X       |       X\r\n  x X       |       X\r\n    X       |       X\r\n    X-------|-------X\r\n    X       |       X\r\n  x X       |       X\r\n    X       |       X\r\n    XXXXXXXXXXXXXXXXX\r\n        x       x\r\nb)  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  Dimensions, x by 4x. Area 4x^2\r\n    X       |       |       |       X\r\n  x X       |       |       |       X\r\n    X       |       |       |       X\r\n    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n        x       x       x       x\r\n	\N	\N
363	9	37	In 1990 a company had a profit of $420000. In 1995 it reported a profit of $1400000.\r\nFind the average rate of change of its profit for that period, expressed in dollars per year.		2014-08-01 22:10:41.156153	2014-08-01 22:10:41.156153	(1,400,000/420,000)/(1995-1990)\r\n  980000/5\r\n $196,000 average increase per year\r\n	\N	\N
364	10	37	Most linear equations can be rewritten in slope-intercept form y = mx + b. Give an example that shows that not all linear equations can be so rewritten.		2014-08-01 22:13:40.793176	2014-08-01 22:13:40.793176	ax + by = c\r\nby = -ax + c\r\ny = -ax/b + c/b\r\n\r\nCan't be done if b is zero, since dividing by zero is undefined.	\N	\N
365	1	38	Which of the following could be the equation that is graphed on the calculator screen shown at right?\r\n(a) 3y − 7x = 28 (b) x + 2y = 5\r\n(c) 12x = y + 13 (d) y − 0.01x = 2000		2014-08-01 22:34:19.601173	2014-08-01 22:34:19.601173	Slope is around 1. y and x intercepts are the same distance from the origin, but y intercept is positive and x intercept is negative.\r\na) has a slope of 7/3, y intercept 28/3, x intercept -4, it could be this one, not the same as the picture but the axes could be scaled differently\r\nb) has a slope of -1/2, y intercept 5/2, x intercept 5, it can't be this one\r\nc) has a slope of 12, y intercept -13, x intercept 13/12, it can't be this one, \r\nd) has a slope of .01, y intercept 2000, x intercept -200000, it can't be this one, the slope is too shallow	PBL_graph_38_1.PNG	\N
370	6	38	The figure at right shows the graphs of two lines. First use the figure to estimate the coordinates of the point that belongs to both lines. The system of equations is\r\n{3x + 2y = 6\r\n 3x − 4y = 17\r\nRandy took one look at these equations and knew right away what to do. “Just subtract the equations and you will find out quickly what y is.” Follow this advice.		2014-08-02 00:06:58.151043	2014-08-02 00:08:25.347255	Estimate: (3.2, -1.9)\r\n  3x + 2y = 6\r\n- 3x − 4y = 17\r\n  0x + 6y = -11\r\ny = -11/6, or -1.8333\r\n\r\n\r\n	PBL_graph_38_6.PNG	\N
367	3	38	(Continuation) Using the same two x2-blocks and same two x-blocks, draw a different rectangle. What is the area of the rectangle?		2014-08-01 23:38:05.111476	2014-08-01 23:38:05.111476	    XXXXXXXX|XX Dimensions, 2x by x+1. Area 2x^2+2x\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    X-------| X\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    XXXXXXXX|XX\r\n        x    1\r\n	\N	\N
366	2	38	Draw a rectangle using two x2-blocks and two x-blocks. Write the dimensions of your rectangle. What is the area of the rectangle?		2014-08-01 23:30:14.580688	2014-08-01 23:39:19.080015	    XXXXXXXX|XXXXXXXXXXXX Dimensions, x by 2x+2. Area 2x^2+2x\r\n    X       |       | | X\r\n  x X       |       | | X\r\n    X       |       | | X\r\n    XXXXXXXX|XXXXXXXXXXXX\r\n        x       x    1 1\r\n	\N	\N
376	11	38	A hot-air balloon ride has been set up so that a paying customer is carried straight up at 50 feet per minute for ten minutes and then immediately brought back to the ground at the same rate. The whole ride lasts twenty minutes. Let h be the height of the balloon (in feet) and t be the number of minutes since the ride began. Draw a graph of h versus t. What are the coordinates of the vertex? Find an equation that expresses h in terms of t.		2014-08-02 00:49:37.421091	2014-08-02 00:49:37.421091	The coordinates of the vertex are (10,500)\r\nThe equation is h = 500-|(t*50)-500|\r\n	\N	PBL_ans_38_10.PNG
368	4	38	(Continuation) One of your diagrams illustrates the equation x(2x + 2) = 2x2 + 2x.\r\nExplain. Write an equation that is illustrated by the other diagram.		2014-08-01 23:38:32.42037	2014-08-01 23:42:00.813545	    XXXXXXXX|XXXXXXXXXXXX is x(2x + 2) = 2x^2 + 2x\r\n    X       |       | | X\r\n  x X       |       | | X\r\n    X       |       | | X\r\n    XXXXXXXX|XXXXXXXXXXXX\r\n        x       x    1 1\r\nThe other diagram illustrates 2x(x+1)\r\n    XXXXXXXX|XX Dimensions, 2x by x+1. Area 2x^2+2x\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    X-------| X\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    XXXXXXXX|XX\r\n        x    1\r\n	\N	\N
369	5	38	Find values for x and y that fit both of the equations 2x − 3y = 8 and 4x + 3y = −2.		2014-08-01 23:45:12.885688	2014-08-01 23:45:12.885688	  2x − 3y = 8\r\n+ 4x + 3y = −2\r\n  6x      = 6\r\nx = 1\r\n3y = -4 - 2\r\n3y = -6\r\ny = -2\r\ncheck:  2 - -6 = 8,  4 + -6 = -2\r\n	\N	\N
372	7	38	(Continuation) Find the missing x-value by inserting the y-value you found into one of the two original equations.\r\nDoes it matter which one? Compare the intersection coordinates with your estimate.		2014-08-02 00:10:09.577697	2014-08-02 00:11:59.97458	3x - 22/6 = 6\r\n18x - 22 = 36\r\n18x = 58\r\nx = 58/18=29/9 or 3.222\r\nIt doesn't really matter which one you choose, although sometimes it's easier to substitute into one than the other.\r\nThe intersection coordinates were close to my estimates. Estimate: (3.2, -1.9), Actual (3.2222,-1.8333(\r\ncheck: 87/9 - 22/6 = 6   ->  174/18 - 66/18 = 108/18 = 6	\N	\N
373	8	38	(Continuation) If you add the two given equations, you obtain the equation of yet another line. Add its graph to the figure. You should notice something. Was it expected?		2014-08-02 00:26:52.270016	2014-08-02 00:26:52.270016	3x + 2y = 6\r\n3x − 4y = 17\r\n6x - 2y = 23\r\n-2y = -6x + 23\r\ny = 3x - 23/2\r\nThis line passes through the same simultaneous solution as the first two.\r\n	\N	PBL_ans_38_8.PNG
374	9	38	Brett is holding three quarters and five dimes. Does Brett have more than one dollar or less than one dollar? Does the point (3, 5) lie above or below the line 0.25x+0.10y = 1.00?		2014-08-02 00:30:01.926121	2014-08-02 00:31:00.173194	More than one dollar, since he has 1.25.\r\nAbove the line.\r\n	\N	PBL_ans_38_9.PNG
375	10	38	Find the value of x that fits the equation (1/2)x + (1/3)x + (1/4)x = 26.		2014-08-02 00:34:25.779723	2014-08-02 00:34:25.779723	(1/2)x + (1/3)x + (1/4)x = 26\r\n6x/12 + 4x/12 + 3x/12 = 26\r\n13x = 26+12\r\n13x = 312\r\nx = 24\r\n\r\ncheck: 12 + 8 + 6 = 26	\N	\N
377	1	39	Fitness Universe has a membership fee of $50, after which individual visits to the gym are $5.50. Non-members pay $8.00 per visit. Stuart is going to exercise at the gym regularly, and is wondering whether it makes sense to become a member. How regularly would Stuart need to visit this gym, in order for a membership to be worth it?		2014-08-02 00:55:39.522721	2014-08-02 00:55:39.522721	5.5v + 50 < 8v\r\n50 < 2.5v\r\nv > 20\r\nHe would have to go more than 20 times during the membership period to make the membership a better deal.\r\ncheck: 5.5*20 + 50 = 160, 5.5*21 + 50 = 165.50\r\n8*20 = 160, 8*21 = 168	\N	\N
380	4	39	Draw a rectangle using one x2-block, three x-blocks and two 1-blocks to illustrate the equation x^2 + 3x + 2 = (x + 1)(x + 2). What are the dimensions of the rectangle? This equation is called an 'identity' because it is true no matter what value is assigned to x.		2014-08-02 21:40:58.236501	2014-08-02 21:45:00.103585	    XXXXXXXXXXXXX\r\n    X       | | X\r\n  x X       | | X\r\n    X       | | X\r\n    X-----------X\r\n  1 X       | } X\r\n    XXXXXXXXXXXXX\r\n        x    1 1 	\N	\N
381	5	39	Graph the equation 2x+3y = 6. Now graph the inequality 2x+3y ≤ 6 by shading all points (x, y) that fit it. Notice that this means shading all the points on one side of the line you drew. Which side? Use a test point like (0, 0) to decide.		2014-08-02 22:11:25.759796	2014-08-02 22:11:25.759796	2x+3y = 6\r\ny = -2x/3 + 2\r\nTesting for 0,0 is less than 6, so the points go below the line.	\N	PBL_ans_39_5.PNG
382	7	39	Find values for x and y that fit both of the equations 5x + 3y = 8 and 4x + 3y = −2.		2014-08-02 22:17:46.740962	2014-08-02 22:23:05.125323	  5x + 3y =  8\r\n- 4x + 3y = −2\r\n   x = 10\r\n  50 + 3y = 8\r\n  3y = -42\r\n  3y = -42/3\r\n   y = 14\r\ncheck: 50 - 42 = 8\r\n	\N	\N
383	6	39	Some questions about the line that passes through the points (−3,−2) and (5, 6):\r\n(a) Find the slope of the line.\r\n(b) Is the point (10; 12) on the line? Justify your answer.\r\n(c) Find y so that the point (7; y) is on the line.		2014-08-02 22:22:52.949727	2014-08-02 22:23:17.344345	a) slope is (6 - -2)/5 - -3) -> 8/8 or 1\r\nb) no, since the slope is one if the rise is 1 the run must be 1, thus the point on the line would be (10,11)\r\nc) (7,8)	\N	\N
384	8	39	A 100-liter barrel of vinegar is 8% acetic acid. Before it can be bottled and used in cooking, the acidity must be reduced to 5% by diluting it with pure water. In order to produce 64 liters of usable vinegar, how many liters of vinegar from the barrel and how many liters of pure water should be combined?		2014-08-02 22:32:18.042756	2014-08-02 22:32:18.042756	64 * .05 = 3.2 liters of vinegar are needed in the 64 liter batch.\r\n3.2/.08 = 40, so it takes 40 liters from the 100 liter barrel.\r\nthe total has to be 64, so 24 liters of pure water need to be added.\r\n\r\ncheck: 3.2/64 = .05, 3.2/.08 = 40	\N	\N
385	9	39	Casey can peel k apples in 10 minutes.\r\n(a) In terms of k, how many apples can Casey peel in one minute?\r\n(b) How many apples can Casey peel in m minutes?\r\n(c) In terms of k, how many minutes does it take Casey to peel one apple?\r\n(d) How many minutes does it take Casey to peel p apples?		2014-08-02 22:32:47.26579	2014-08-02 22:47:19.384669	a)k/10\r\nb)k/(10/m)\r\nc)10/k\r\nd)10/(k/p)	\N	\N
386	10	39	Express each as a single fraction: \r\n(a) 1/a + 2/b + 3/c\r\n(b) 1/a + 1/(b + c)\r\n(c) 1 + 2/(a + b)		2014-08-02 22:53:06.085524	2014-08-02 22:53:06.085524	(a 1/a + 2/b + 3/c\r\n   bc/abc + 2ac/abc + 3ab/abc\r\n   (bc + 2ac + 3ab)/abc\r\n(b 1/a + 1/(b + c)\r\n   (b+c)/(ab+ac) + a/(ab+ac)\r\n   (a+b+c)/(ab+ac)\r\nc) 1 + 2/(a + b)\r\n  (a+b)/(a+b) + 2/(a+b)\r\n  (a+b+2)/(a+b)	\N	\N
387	11	39	Graph y = 3|x−2|−6, and find coordinates for the vertex and the x- and y-intercepts.		2014-08-02 22:56:45.744447	2014-08-02 22:56:45.744447	Vertex = (2, -6)\r\nx intercepts = 0, 4\r\ny intercept =  0	\N	PBL_ans_39_11.PNG
388	1	40	The figure at right shows the graphs of two lines. Use the figure to estimate the coordinates of the point that belongs to both lines. The system of equations is\r\n{ 4x + 3y = 20\r\n  3x − 2y = −5\r\nLee took one look at these equations and announced a plan: “Just multiply the first equation by 2 and the second equation by 3.” What does changing the equations in this way do to their graphs?		2014-08-02 23:08:00.496769	2014-08-02 23:08:00.496769	Estimate: (1.5,4.6)\r\nDoubling or tripling the graph moves the y intercept but doesn't change the slope.\r\n	\N	\N
389	2	40	(Continuation) Lee’s plan has now created a familiar situation. Do you recognize it? Complete the solution to the system of equations. Do the coordinates of the point of intersection agree with your initial estimate?		2014-08-02 23:15:03.9624	2014-08-02 23:15:03.9624	{ 4x + 3y = 20\r\n  3x − 2y = −5\r\n\r\n  8x + 6y =  40\r\n+ 9x - 6y = -15\r\n 17x + 0y = 25\r\nx = 25/17 or ~1.47\r\n3y + 100/17 = 20\r\n3y = 340/17 - 100/17\r\n3y = 240/17\r\ny = 80/17 or ~4.71\r\nThe results above are very close to the estimates.\r\ncheck: 100/17 + 240/17 = 340/17 = 20\r\n75/17 - 160/17 = -85/17 = -5\r\n	\N	\N
390	3	40	The diagram consists of two x2-blocks, five x-blocks and three 1-blocks. Use this diagram to write a statement that says that the product of the length and width of this particular rectangle is the same as its area. Can you draw another rectangle with the same area but different dimensions?		2014-08-02 23:25:10.589729	2014-08-02 23:25:10.589729	(x + 1)(2x + 3) = 2x^2 + 5x + 3\r\nI don't think there is another rectangle, since the x^2 blocks have to be next to each other and can't otherwise be matched up with the 1 blocks.\r\n	\N	\N
391	4	40	Sandy’s first four test scores this term are 73, 87, 81 and 76. To have at least a B test grade, Sandy needs to average at least 80 on the five term tests (which count equally). Let t represents Sandy’s score on the fifth test, and write an inequality that describes the range of t-values that will meet Sandy’s goal.		2014-08-02 23:30:53.610315	2014-08-02 23:30:53.610315	73+87+81+76+t >= 400\r\nt >= 400-317\r\n83 <= t <= 100	\N	\N
392	5	40	Graph solutions on a number line: (a) |x+8| < 20 (b) |2x−5| ≤ 7 (c) 3|4−x| ≥ 12		2014-08-03 00:02:40.013729	2014-08-03 00:02:40.013729	a) |x + 8| < 20,  x + 8 = 20 or x + 8 = -20,  x < 12 and x > -28 are solutions, or -28 < x < 12\r\n---o====|====|====|====|====|====|====|====|====|====o----\r\n  -28  -24  -20  -16  -12  =8   -4    0    4    0   12\r\nb)|2x−5| ≤ 7,  2x-5 ≤ 7 or 2x - 5 ≤ -7,  2x ≤ 12 or 2x ≤ -2,   x ≤ 6 or x ≥ -1 or -1 ≤ x ≤ 6\r\n---*====|====|====|====|====|====|====*---\r\n  -1    0    1    2    3    4    5    6\r\nc) 3|4−x| ≥ 12,  |4 - x| ≥ 4, 4-x ≥ 4 or 4-x ≤ -4, -x ≥ 0 or -x ≤ -8, x ≤ 0 or x ≥ 8\r\n===|====*----|----|----|----|----|----|----|----*====|====\r\n  -1    0    1    2    3    4    5    6    7    8    9	\N	\N
394	7	40	The diagram at right shows a rectangle that has been cut into nine square pieces, no two being the same size. Given that the smallest piece is 2 cm by 2 cm, figure out the sizes of the other eight pieces. A good strategy is to start by guessing the size of one of the pieces adjacent to the smallest piece. By checking your guess, you will discover the hidden equation.		2014-08-03 00:26:22.50141	2014-08-03 00:35:21.850267	Picture attached\r\n\r\n\r\n	\N	PBL_ans_40_7.PNG
395	8	40	Solve the system of equations 2x + y = 5 and 5x−2y = 8 algebraically. Check your answer graphically.		2014-08-03 00:45:38.164243	2014-08-03 00:45:38.164243	   2x +  y = 5 \r\n   5x − 2y = 8\r\n\r\n   4x + 2y = 10 \r\n   5x − 2y = 8\r\n+  9x      = 18\r\nx = 2\r\n4 + y = 5\r\ny = 1\r\ncheck: 4+1 = 5, 10-2 = 8	\N	PBL_ans_40_8.PNG
393	6	40	Shade the points in the plane whose x-coordinates are greater than their y-coordinates.\r\nWrite an inequality that describes these points.		2014-08-03 00:10:24.824245	2014-08-03 00:45:57.875855	Y < x	\N	PBL_ans_40_6.PNG
396	1	41	Raisins make up two thirds of a well-mixed bowl of peanuts and raisins. If half the mixture is removed and replaced with peanuts, what fraction of the bowl will be raisins?		2014-08-03 00:49:29.864302	2014-08-03 00:49:29.864302	r = 4/6  p = 2/6\r\n1/2 bowl is thus 2/6r and 1/6 p\r\nAdd 3/6p\r\nFinal mix is now 1/3r and 2/3p	\N	\N
397	2	41	A large telephone company sent out an offer for pre-paid phone cards. The table below accompanied the ad and summarized their offer. Does this data form a linear relationship? Explain your answer. Which offer has the best rate per minute?		2014-08-03 17:11:23.884993	2014-08-03 17:11:23.884993	min       75    150    300    500    1000    1500\r\ncost    4.95   9.90  19.80  30.00   56.00   75.00\r\nrate   0.066  0.066  0.066   0.06    0.56    0.05\r\n\r\nThe rates are linear through 300 minutes, but not for the last three, since the price then goes down a little as more minutes are bought. The 1500 minute card has the best rate, assuming all the minutes are actually used.	PBL_graph_41_2.PNG	\N
398	3	41	Find an equation for each of the following lines. When possible, express your answer in both point-slope form and slope-intercept form.\r\n(a) The line passes through (3, 5), and has −1.5 as its slope.\r\n(b) The line is parallel to the line through (−8, 7) and (−3, 1), and has 6 as its x-intercept.\r\n(c) The line is parallel to the line x = −4, and it passes through (4, 7).		2014-08-03 17:45:08.012939	2014-08-03 17:45:08.012939	a) y - 5 =  -1.5(x-3)   y = -1.5x + 9.5\r\nb) slope is (7-1)/(-8- -3) or -6/5, has point (6,0).  y = -6/5(x - 6) or y = -6x/5 + 36/5 \r\nc) x = 4, no slope-intercept form	\N	\N
399	4	41	Jess and Wes used to race each other when they were younger. Jess could cover 8 meters per second, but Wes could cover only 5 meters per second, so Jess would sportingly let Wes start 60 meters ahead. They would both start at the same time and continue running until Jess caught up with Wes. How far did Jess run in those races?		2014-08-03 17:47:54.374707	2014-08-03 17:47:54.374707	8t = 5t + 60\r\n3t = 60\r\nt = 20 seconds\r\nJess would run 160 meters.\r\n\r\ncheck: 5*20 + 60 = 160	\N	\N
400	5	41	Use a different color for the regions described in parts (a) and (b):\r\n(a) Shade all points whose x- and y-coordinates sum to less than 10.\r\n(b) Shade all points whose x- and y-coordinates are both greater than zero.\r\n(c) Write a system of three inequalities that describe where the two regions overlap.		2014-08-03 18:00:46.716051	2014-08-03 18:02:15.718897	a) shaded brown\r\nb) shaded blue\r\nc) shaded purple, y > 0, x > 0, y < 10 - x	\N	PBL_ans_41_5.PNG
401	6	41	The figure at right shows the graphs of two lines. Use the figure to estimate the coordinates of the point that belongs to both lines. The system of equations is\r\n{4x + 3y = 20\r\n y = 2x − 2\r\nDale took one look at these equations and offered a plan: “The second equation says you can substitute 2x − 2 for y in the first equation. Then you have only one equation to solve.” Explain the logic behind Dale’s substitution strategy. Carry out the plan, and compare the exact coordinates of the intersection point with your estimates.		2014-08-03 20:50:35.246763	2014-08-03 20:50:35.246763	Estimate: (2.5,3.2)\r\nThe logic is that since the second equation tells us what y is in terms of x, we can substitute the x term in place of the y term, and the equation will still be equal.\r\n4x + 3y = 20\r\n y = 2x − 2\r\n4x + 3(2x - 2) = 20  ->  4x + 6x - 6 = 20  ->  10x = 26  ->  x = 13/5 or 2.6\r\ny = 26/5 - 10/5 = 16/5 or 3.2 - My estimates were very close\r\ncheck:  52/5 + 48/5 = 100/5 = 20	\N	\N
402	7	41	Farmer MacGregor wants to know how many cows and ducks are in the meadow. After counting 56 legs and 17 heads, the farmer knows. How many cows and ducks are there?		2014-08-03 20:58:00.13665	2014-08-03 20:58:00.13665	There are 17 animals, some with 2 legs and some with four.\r\nSo 2c + 4d = 56\r\nc + d = 17, so c = 17 - d, we can substitute 17-d for c.\r\n2(17-d) + 4d = 56\r\n34-2d+4d = 56\r\n2d = 22\r\n11 ducks and 6 cows\r\nchecks:  11*4 + 6*2 = 56	\N	\N
403	8	41	What are the x- and y-intercepts of y = |x − h| + k, and what are the coordinates of its vertex?		2014-08-03 21:17:52.745448	2014-08-03 21:17:52.745448	y = |x − h| + k\r\nx intercept -> 0 = |x − h| + k -> -k = |x-h|  ->  -k = x-h or k = x-h  ->   x = -k-h or x = -k+h, though this only occurs if k is less than zero.\r\ny intercept -> y = |-h| + k  ->  y = k - h\r\nvertex is (h,k)	\N	\N
408	3	42	Three gears are connected so that two turns of the first wheel turn the second wheel nine times and three turns of the second wheel turn the third wheel five times. \r\n(a) If you turn the first wheel once, how many times does the third wheel turn?\r\n(b) How many times must you turn the first wheel so that the third wheel turns 30 times?		2014-08-04 01:39:13.796252	2014-08-04 01:39:13.796252	a) (9/2) * 5/3 = 45/6 turns or 7.5 turns\r\nb) If one turn of wheel #1 produces 7.5 turns of wheel #3, then 4 turns of wheel #1 should produce 30 turns of wheel #3\r\n\r\ncheck: 4 turns of wheel one produces 18 turns of wheel 2. 18 turns is 6 groups of 3, so the third wheel will turn 6*5 or 30 times.	\N	\N
405	8	41	What are the x- and y-intercepts of y = |x − h| + k, and what are the coordinates of its vertex?		2014-08-03 21:25:22.955775	2014-08-03 21:25:22.955775	y = |x − h| + k\r\nx intercept -> 0 = |x − h| + k -> -k = |x-h|  ->  -k = x-h and k = x-h  ->   x = -k-h and x = -k+h, though this only occurs if k is less than zero.\r\ny intercept -> y = |-h| + k  ->  y = k - h\r\nvertex is (h,k)	\N	\N
406	1	42	Create a rectangle by combining two x2-blocks, three x-blocks and a single 1-block. Write expressions for the length and width of your rectangle. Using these expressions, write a statement that says that the product of the length and width equals the area.		2014-08-03 21:30:44.728505	2014-08-04 01:27:31.7183	    XXXXXXXXXXXXXXXXXXX  Length = 2x + 1\r\n    X       |       | X  Width = x + 1\r\n  x X       |       | X  Area = (2x + 1)(x + 1) = 2x^2 + 3x + 1\r\n    X       |       | X\r\n    X-----------------X\r\n  1 X       |       | X\r\n    XXXXXXXXXXXXXXXXXXX\r\n        x       X    1 	\N	\N
407	2	42	(Continuation) Instead of saying, “Find the dimensions of a rectangle made with two x2-blocks, three x-blocks and one 1-block”, mathematicians say “Factor 2x2 + 3x + 1.” It is also customary to write the answer 2x2 + 3x + 1 = (2x + 1)(x + 1). Explain why the statement about the blocks is the same as the algebraic equation.		2014-08-04 01:30:58.624582	2014-08-04 01:30:58.624582	The two terms are like the length and width of a rectangle. Multiplying them gives the area. So if you count up the numbers of the various types of objects formed when you make a rectangle out of algebra blocks, you have effectively multiplied the two terms. Since you know the two expressions are equivalent, you can go the other way too, i.e., start with the area and get back the two sides, i.e. factoring the equation.	\N	\N
409	4	42	How much money do you have, if you have d dimes and n nickels? Express your answer in (a) cents; (b) dollars.		2014-08-04 01:40:20.630816	2014-08-04 01:40:20.630816	in cents: 10d + 5n\r\nin dollars: .1d + .05n\r\n	\N	\N
410	5	42	How many nickels have the same combined value as q quarters and d dimes?		2014-08-04 01:42:42.187028	2014-08-04 01:42:42.187028	q*5 + d*2	\N	\N
411	6	42	Find the point (x, y) that fits both of the equations y = 1.5x + 2 and 9x + 4y = 41.		2014-08-04 02:12:21.16324	2014-08-04 02:12:21.16324	{   y = 1.5x + 2\r\n   9x + 4y = 41\r\n-1.5x + y  = 2\r\n   9x + 4y = 41\r\n  -9x + 6y = 12\r\n       10y = 53\r\n         y = 53/10\r\n  9x + 212/10 = 410/10\r\n  9x = 198/10\r\n   x = 198/90\r\n   x = 99/45\r\ncheck: 99/45*3/2+2 = 5.3 or 53/10\r\n	\N	\N
425	1	44	1. Find an equation for the line that passes through the point (−3, 6), parallel to the line through the points (0, −7) and (4,−15). Write your answer in point-slope form.		2014-08-04 16:41:53.218719	2014-08-04 18:17:39.181216	Slope is -2.\r\nequation is (y - 6) = -2(x + 3) \r\ncheck: y = -2x -6 + 6\r\n       y = -2x\r\n       6 = -2*-3	\N	\N
412	7	42	Sam boards a ski lift, and rides up the mountain at 6 miles per hour. Once at the top, Sam immediately begins skiing down the mountain, averaging 54 miles per hour, and does not stop until reaching the entrance to the lift. The whole trip, up and down, takes 40 minutes. Assuming the trips up and down cover the same distance, how many miles long is the trip down the mountain?		2014-08-04 02:20:25.948401	2014-08-04 02:20:25.948401	6u = 54d \r\n u = 9d\r\nu + d = 40\r\n10d = 40\r\nu = 4, 4 minutes to come down and 36 minutes on the way up. 6 mph is .1 miles per minute. .1 8 36 is 3.6 miles for the trip.\r\nCheck: 54 mph is .9 miles per minute. .9 * 4 = 3.6 miles for the downhill run.	\N	\N
413	8	42	If the price of a stock goes from $4.25 per share to $6.50 per share, by what percent has the value of the stock increased?		2014-08-04 02:24:27.311997	2014-08-04 02:24:27.311997	6.50-4.25 = 1.529, so about 53%	\N	\N
414	9	42	Your company makes spindles for the space shuttle. NASA specifies that the length of a spindle must be 12:45 ± 0:01 cm. What does this mean? What are the smallest and largest acceptable lengths for these spindles? Write this range of values as an inequality, letting L stand for the length of the spindle. Write another inequality using absolute values that models these constraints.		2014-08-04 05:42:51.999764	2014-08-04 05:42:51.999764	It means that there is an acceptable variation in length that is specified by how much longer or shorter is can be and still be acceptable.\r\nIn this case, the shortest acceptable spindle would be 12.44 cm, and the longest 12.46.\r\n12.44 <= L <= 12.46\r\n|12.45 - L| <= .01\r\n	\N	\N
415	10	42	Factor each expression and draw an algebra-block diagram:\r\n(a) 3x^2 + 12x (b) x^2 + 5x + 6 (c) 4xy + 2y2		2014-08-04 06:10:15.964899	2014-08-04 06:10:15.964899	(a) 3x^2 + 12x    (x)(3x+4)\r\n(b) x^2 + 5x + 6  (x + 3)(x + 2)\r\n(c) 4xy + 2y2     (2y)(2x + y)\r\n\r\n	\N	PBL_ans_42_10.PNG
416	11	42	Pat and Kim are walking in the same direction along Front Street at a rate of 4 mph. Pat started from the Library at 8 am, and Kim left from the same spot 15 minutes later.\r\n(a) Draw a graph that plots Pat’s distance from the Library versus time.\r\n(b) On the same coordinate-axis system, draw a graph that plots Kim’s distance from the Library versus time.		2014-08-04 06:19:19.846885	2014-08-04 06:19:19.846885		\N	PBL_ans_42_11.PNG
417	1	43	Jan has a 18"×18"×12" gift box that needs to be placed carefully into a 2′×2′×2′ shipping carton, surrounded by packing peanuts.\r\n(a) How many 1-cubic-foot bags of peanuts does Jan need to buy?\r\n(b) Jan opens one bag of peanuts and spreads them evenly on the bottom of the shipping carton. What is the resulting depth of the peanuts?\r\n(c) Jan centers the square base of the gift box on the peanut layer, pours in another bag of peanuts, and spreads them around evenly. Now how deep are the peanuts?\r\n(d) Explain why the third bag of peanuts will cover the gift box.		2014-08-04 06:35:00.749162	2014-08-04 06:35:00.749162	a) box capacity, 2x2x2 or 8 cubic feet. Size of package, 1.5x1.5x1, or 2.25 cubic feet, so she will need to buy 6 cubic feet of packing peanuts.\r\nb) 1 cubic foot = tx2x2 = 4t. t = 1/4 of a cubic foot, or 3 inches deep.\r\nc) Around the box there will be two areas 2'x.25'x1' and two areas 1.5'x.25'x1. The first area needs .5 cubit feet, while the second needs .375 each. So the total needed to reach the top of the box would be .5+.5+.275+.375, which is 1.75 cubic feet. The one cubic foot she adds will fill 1/1.75 of the space, or about .57 of it. Since the box is 12 inches tall, that means it will be filled about 6.86 inches.\r\nd) The third bag will cover the top because the second bag fills more than half of the space around the box. However she will need nearly three more bags as the upper 9 inches of the box are empty, and that makes about 3 cubic feet.	\N	\N
418	2	43	What is unusual about the graphs of the equations 9x−12y = 27 and −3x+4y = −9?		2014-08-04 06:40:11.866285	2014-08-04 06:40:11.866285	  9x−12y = 27\r\n -12y = -9x + 27\r\n    y = 3x/4 - 27/12\r\n    y = 3x/4 - 9/4\r\n\r\n  −3x+4y = −9\r\n   4y = 3x - 9\r\n    y = 3x/4 - 9/4   \r\nThey are equivalent equations, so they have the same graph.	\N	\N
419	3	43	The fuel efficiency m (in miles per gallon) of a truck depends on the speed r (in miles per hour) at which it is driven. The relationship between m and r usually takes the form m = a|r − h| + k. For Sasha’s truck, the optimal fuel efficiency is 24 miles per gallon, attained when the truck is driven at 50 miles per hour. When Sasha drives at 60 miles per hour, however, the fuel efficiency drops to only 20 miles per gallon.\r\n(a) Find another driving speed r for which the fuel efficiency of Sasha’s truck is exactly 20 mpg.\r\n(b) Fill in the rest of the missing entries in the table. \r\n(c) Draw graph of m versus r, for 0 < r ≤ 80.\r\n(d) Find the values of k, a, and h.		2014-08-04 15:41:37.641662	2014-08-04 15:41:37.641662	a) 40 mph\r\nb) r   60  50  40  30  20  10\r\n   m   20  24  20  16  12   8\r\nc) attached\r\nd) m = a|r − h| + k\r\n  24 = a|50- h| + k\r\na = -2/5, h = 50, k = 24\r\n  m = -2/5|r-50| + 24	PBL_graph_43_3.PNG	\N
420	4	43	With parental assistance, Corey buys some snowboarding equipment for $500, promising to pay $12 a week from part-time earnings until the 500-dollar debt is retired. How many weeks will it take until the outstanding debt is under $100? Write an inequality that models this situation and then solve it algebraically.		2014-08-04 15:45:09.589757	2014-08-04 15:45:09.589757	500 - 12w < 100\r\n500 < 12w + 100\r\n12w > 400\r\nw > 34\r\n\r\ncheck: in 33 weeks he has paid back $396.	\N	\N
421	5	43	The rails on a railroad are built from thirty-foot sections. When a train wheel passes over the junction between two sections, there is an audible click . Inside a train that is\r\ntraveling at 70 mph, how many clicks can a passenger hear during a 20-second interval?		2014-08-04 15:51:26.874756	2014-08-04 15:51:26.874756	70 mph = 369600 feet per hour  369600/60 = 6160 feet per minute, 6160/3, 2053.3 feet in each twenty second interval. 2053/30 gives about 68.4 clicks per rail. Since there are two rails the final answer is 136.8 or about 137 clicks in each 20 second interval.	\N	\N
422	6	43	In attempting to calculate the carrying capacity of a cylindrical pipe, Avery measured the outer diameter to be 2 inches, neglecting to notice that the pipe was one eighth of an inch thick. By what percent did Avery overestimate the carrying capacity of the pipe?		2014-08-04 16:19:17.941415	2014-08-04 16:19:17.941415	The carrying capacity of the pipe is a function of its area. The area of any piece of the pipe is pi*r^2. The outer area is pi*1*1 or about 3.14 square inches. The area of the part that actually carries water is smaller than that, the radius is .875 rather than 1, giving an area of pi*.875*.875 or about 2.41 square inches. 3.14/2/41 = 1.306, so Avery overestimated by about 31%.	\N	\N
423	7	43	On 3 January 2004, after a journey of 300 million miles, the rover Spirit landed on Mars and began sending back information to Earth. It landed only six miles from its target. This accuracy is comparable to shooting an arrow at a target fifty feet away and missing the exact center by what distance?		2014-08-04 16:24:18.838265	2014-08-04 16:24:18.838265	6/300,000,000 = 0.00000002\r\n50 * 0.00000002 = 0.000001 feet\r\n0.000001 feet = 0.00000083 inches	\N	\N
424	8	43	Graph y = 2|x + 1| − 3, then describe in general terms how the graph of y = |x| is transformed to produce the graph of y = a|x − h| + k.		2014-08-04 16:29:51.422471	2014-08-04 16:29:51.422471	The vertex is (-1,-3), meaning it is moved on the x axis by -h and on the y by k.\r\nThe slope for the part to the right of the vertex will be a, and to the left of the vertex it will be -a	\N	PBL_ans_43_8.PNG
426	2	44	Sid has a job at Morgan Motors. The salary is $1200 a month, plus 3% of the sales price of every car or truck Sid sells (this is called a commission).\r\n(a) The total of the sales prices of all the vehicles Sid sold during the first month on the job was $72000. What was Sid’s income (salary plus commission)?\r\n(b) In order to make $6000 in a single month, how much selling must Sid do?\r\n(c) Write a linear equation that expresses Sid’s monthly income y in terms of the value x of the vehicles Sid sold.\r\n(d) Graph this equation. What are the meanings of its y-intercept and slope?		2014-08-04 19:43:13.241428	2014-08-04 19:43:13.241428	s) 1200 + 72000*.03 = $3360\r\nb) 1200 + .03s = 6000 ->  .03s = 4800 -> s = 14,400\r\nc) y = .03x + 1200\r\nd) 	\N	PBL_ans_44_2.PNG
427	3	44	I recently paid $85.28 for 12.2 pounds of coffee beans. What was the price per pound of the coffee? How many pounds did I buy per dollar?		2014-08-04 19:47:50.069888	2014-08-04 19:47:50.069888	$6.99 per pound\r\n0.143 pounds per dollar\r\n\r\ncheck: 0.143*85.28 =  12.2 \r\n\r\n	\N	\N
428	4	44	Find the value of x that fits the equation 1.24x − (3 − 0.06x) = 4(0.7x + 6).		2014-08-04 19:55:23.796186	2014-08-04 19:55:23.796186	1.24x − (3 − 0.06x) = 4(0.7x + 6)\r\n1.24x - 3 + 0.06x = 2.8x + 24\r\n1.3x - 3 = 2.8x + 24\r\n-27 = 3x/2\r\n3x = -54\r\nx = -18\r\n\r\ncheck: 1.24(-18) - (3 - 0.06(-18) = 4(0.7(-18) + 6\r\n-22.32 - 3 + (-1.08) = 4(-12.6 + 6)\r\n-26.4 = -26.4\r\n	\N	\N
429	5	44	At the Exeter Candy Shop, Jess bought 5.5 pounds of candy — a mixture of candy priced at $4 per pound and candy priced at $3.50 per pound. Given that the bill came to $20.75, figure out how many pounds of each type of candy Jess bought.		2014-08-04 20:00:43.0117	2014-08-04 20:00:43.0117	4c + 3.5d = 20.75\r\nc + d = 5.5\r\nc = 5.5 - d\r\n4(5.5-d)+3.5d = 20.75\r\n22 - 4d + 3.5d = 20.75\r\n22 - .5d = 20.75\r\n.5d = 1.25\r\nd = 2.5, c = 3\r\ncheck: 2.5*3.5 + 3*4 = 20.75\r\n	\N	\N
430	6	44	Explain how to evaluate 4^3 without a calculator. The small raised number is called an exponent, and 4^3 is a power of 4 . Write 4 · 4 · 4 · 4 · 4 as a power of 4. Write the product 4^3 · 4^5 as a power of 4.		2014-08-04 20:03:09.369086	2014-08-04 20:03:09.369086	4^3 is 4*4*4 or 16*4 or 64\r\n4^5\r\n4*4*4*4*4*4*4*4	\N	\N
431	7	44	Does every system of equations px + qy = r and mx + ny = k have a simultaneous solution (x; y)? Explain.		2014-08-04 20:04:40.824846	2014-08-04 20:04:40.824846	Not necessarily. If the lines have the same slope but different intercepts they will be parallel and thus there won't be a point common to both lines.	\N	\N
432	8	44	Write a plausible equation for each of the three graphs shown in the diagram at right.		2014-08-04 20:10:08.490141	2014-08-04 20:10:08.490141	a) y = |x - 1| + 2\r\nb) y = -|x| + 1\r\nc) y = 2|x + 3| - 1	PBL_graph_44_8.PNG	\N
433	9	44	Sketch the region that is common to the graphs of x ≥ 2, y ≥ 0, and x + y ≤ 6, and find its area.		2014-08-04 20:17:05.951236	2014-08-04 20:17:05.951236	Graph attached, the area of the resulting triangle is 2	\N	PBL_ans_44_9.PNG
434	10	44	You have one x2-block, six x-blocks (all of which you must use), and a supply of 1-blocks. How many different rectangles can you make? \r\nDraw an algebra block diagram for each.		2014-08-04 20:30:46.080184	2014-08-04 20:30:46.080184	4 rectangle, graph attached	\N	PBL_ans_44_10.PNG
435	11	44	The base of a rectangular tank is three feet by two feet, and the tank is three feet tall. The water in the tank is currently nine inches deep.\r\n(a) How much water is in the tank?\r\n(b) The water level will rise when a one-foot metal cube (denser than water) is placed on the bottom of the tank. By how much?\r\n(c) The water level will rise some more when a second one-foot metal cube is placed on the bottom of the tank, next to the first one. By how much?		2014-08-04 20:42:08.33258	2014-08-04 20:42:08.33258	a) 3*2*.75 = 4.5 cubic feet\r\nb) 5.5 = 3*2*h  ->  6h = 5.5  ->  ,91667 - .75 = 0.1667 feet, but it will be less because a little of the cube will be above the water\r\nc) 6.5 = 3*2*h  -> 6h = 6.5  -> 1.0833, the water will cover both cubes	\N	\N
436	1	45	Wes walks from home to a friend’s house to borrow a bicycle, and then rides the bicycle home along the same route. By walking at 4 mph and riding at 8 mph, Wes takes 45 minutes for the whole trip. Find the distance that Wes walked.		2014-08-04 20:48:59.617512	2014-08-04 20:48:59.617512	w = 2b\r\n3b = 45\r\nb = 15, he rode for 15 minutes and walked for 30.\r\n30/60*4 = 2, 2 miles\r\ncheck: 15/60*8 = 2 miles	\N	\N
437	2	45	Given that s varies directly with t, and that s = 4.56 meters when t = 3 seconds, find s when t is 4.2 seconds.		2014-08-04 20:51:46.850716	2014-08-04 20:51:46.850716	4.56/3 = s/4.2\r\n3s = 19.152\r\ns = 6.384 meters	\N	\N
438	3	45	Five gerbils cost p dollars. How many dollars will it cost to buy g gerbils? How many gerbils can you purchase for d dollars?		2014-08-04 20:55:09.163757	2014-08-04 20:55:09.163757	One gerbil costs p/5 dollars.\r\ng gerbils would cost (g*p)/5\r\nd/(p/5)	\N	\N
439	4	45	What values of x satisfy the inequality |x| > 12? Graph this set on a number line, and describe it in words. Answer the same question for |x − 2| > 12.		2014-08-04 20:55:58.426282	2014-08-04 20:55:58.426282		\N	\N
440	5	45	The figure at the right shows a rectangular box whose dimensions are 8 cm by 10 cm by 12 cm.\r\n(a) Find the volume of the solid.\r\n(b) What is the combined area of the six faces?\r\n(c) If you were to outline the twelve edges of this box with decorative cord, how much would you need?		2014-08-04 23:42:35.156958	2014-08-04 23:42:35.156958	a) 8*10*12 = 960 cc\r\nb) 160+240+192 = 584 cm^2\r\nc) 4*8 + 4*10 + 4*12 = 32+40+48 = 120 cm	\N	\N
441	6	45	The population of Exeter is about 15 thousand persons. The population of the United States is about 300 million persons. What percent of the US population lives in Exeter?		2014-08-04 23:45:30.428457	2014-08-04 23:45:30.428457	15/300000 = .00005 or 0.005%, i.e. 5/1000ths of a percent.	\N	\N
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('questions_id_seq', 441, true);


--
-- Data for Name: questions_topics; Type: TABLE DATA; Schema: public; Owner: action
--

COPY questions_topics (question_id, topic_id) FROM stdin;
3	3
1	4
82	5
82	1
27	6
71	7
83	5
84	4
84	5
85	8
86	1
85	1
87	6
88	9
89	9
90	1
81	6
91	1
91	10
92	1
92	8
92	10
94	1
94	9
80	1
80	9
2	8
7	4
7	5
93	6
79	6
78	1
77	6
95	1
96	1
97	7
98	1
98	5
99	1
99	8
99	10
100	1
102	1
102	8
103	6
104	6
105	1
105	7
106	6
107	8
108	1
108	5
109	1
109	10
110	1
110	9
110	10
111	6
113	1
113	10
114	1
114	9
115	7
115	10
116	1
116	8
117	1
117	8
117	10
118	1
119	9
120	2
121	2
123	2
122	2
124	2
125	2
125	8
126	2
127	6
129	1
129	9
131	4
131	9
131	10
131	5
133	9
134	4
134	10
134	5
135	6
136	4
136	2
137	8
138	2
139	4
139	10
140	2
142	1
142	10
143	1
143	10
144	6
144	1
145	4
145	2
146	7
147	4
148	4
149	6
150	6
150	10
151	4
152	4
152	2
153	1
153	10
155	9
156	2
157	1
157	9
158	5
130	2
160	2
161	2
164	2
165	4
165	2
165	5
166	10
167	2
168	2
168	9
169	1
170	1
170	10
172	1
172	6
173	6
174	6
175	2
176	10
177	1
177	9
178	1
178	2
179	2
180	2
181	8
182	4
182	5
183	1
183	5
184	1
184	7
185	9
186	9
187	1
187	10
188	2
190	1
190	10
191	4
191	2
191	10
192	1
192	4
193	2
195	6
159	1
196	1
197	6
197	1
197	10
198	1
198	10
199	2
200	4
200	5
201	8
202	2
203	2
205	4
205	5
206	7
206	9
206	10
207	1
207	10
208	6
209	9
210	1
210	7
211	1
211	4
211	9
211	10
213	9
214	2
215	1
215	9
216	6
217	1
217	4
218	9
219	1
219	10
220	1
220	9
221	1
221	10
222	3
223	2
224	6
225	2
225	8
225	3
226	1
226	7
227	2
227	8
228	4
228	2
228	8
229	6
230	8
231	1
231	2
232	1
232	2
233	1
233	10
234	9
235	9
235	10
236	2
236	3
237	2
237	3
238	2
238	3
239	3
239	9
240	9
241	9
242	2
242	3
243	2
244	6
245	1
245	10
246	6
247	4
248	2
248	3
249	2
249	3
250	8
251	6
252	1
252	10
253	4
253	3
253	10
254	2
254	3
255	3
256	2
256	3
257	6
258	1
258	9
259	6
260	6
262	2
262	3
263	1
264	2
264	3
265	2
265	3
266	3
267	6
268	6
269	2
269	5
270	6
271	6
272	6
273	6
274	1
274	4
274	9
275	6
276	6
277	6
278	2
278	3
279	2
279	3
280	2
280	3
281	6
282	2
282	3
283	1
283	9
284	3
284	5
285	6
286	6
286	9
287	1
287	10
288	4
288	2
289	6
290	6
290	2
291	6
292	6
292	1
293	6
293	1
294	6
294	9
295	2
295	3
296	2
296	3
297	1
297	2
297	3
298	6
299	1
299	3
299	10
300	9
300	10
301	2
302	2
302	3
303	1
303	10
304	2
304	3
305	1
305	10
306	6
307	2
307	3
308	6
309	6
309	2
310	1
310	10
311	1
312	10
312	5
313	2
313	3
314	3
315	6
315	2
316	1
316	10
317	1
317	8
318	2
318	3
319	6
319	2
320	6
320	2
321	1
321	9
321	10
322	2
322	3
323	6
323	2
324	8
324	3
325	3
326	1
327	9
327	10
328	6
329	6
329	2
331	1
331	9
331	10
332	9
333	7
334	6
334	1
335	6
335	2
335	10
336	6
337	7
337	9
338	1
338	8
339	1
340	6
341	6
342	6
342	2
343	6
344	6
344	1
344	4
344	2
345	1
345	4
345	10
345	5
346	6
347	6
347	2
348	1
349	2
349	3
350	2
350	8
350	3
351	2
351	3
352	6
353	2
353	3
354	1
355	1
356	1
356	2
356	3
357	6
357	2
358	6
359	2
360	1
360	10
361	3
361	10
362	1
363	3
363	9
364	3
365	2
365	3
366	1
367	1
368	1
369	10
370	10
372	10
373	10
374	6
375	10
376	6
377	1
377	10
378	2
378	3
379	6
380	1
381	6
381	2
382	10
383	2
383	3
384	8
385	1
386	9
387	6
387	2
388	2
388	3
389	2
389	3
389	10
390	1
391	6
391	10
392	6
393	6
394	8
395	10
396	1
396	8
397	8
397	3
397	9
398	2
398	3
399	1
399	10
400	6
400	1
401	1
401	8
401	10
402	1
402	10
403	6
405	6
406	1
407	1
408	8
408	9
409	9
409	5
410	1
410	9
410	5
411	1
411	3
411	10
412	1
412	10
412	5
413	9
414	6
415	1
415	10
416	4
416	2
417	8
417	9
417	10
417	5
418	2
418	3
419	6
419	2
419	8
419	10
420	6
420	1
420	4
420	10
421	8
421	9
421	5
422	8
422	9
422	5
423	8
423	9
423	5
424	6
424	2
425	1
425	3
426	2
426	3
426	10
427	9
427	10
427	5
428	1
428	9
428	10
429	1
429	10
430	9
431	3
432	6
432	3
433	6
433	2
434	1
435	1
435	10
435	5
436	1
436	4
436	10
437	4
437	9
438	1
440	9
440	5
441	9
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: action
--

COPY schema_migrations (version) FROM stdin;
20140210193621
20140210194914
20140211141945
20140705055628
20140714023545
20140724180704
20140730174716
20140731035952
20140802051332
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: action
--

COPY topics (id, "topicName", comments, created_at, updated_at) FROM stdin;
2	Graphing		2014-02-20 17:10:37.16577	2014-02-20 17:10:37.16577
3	Linear Algebra		2014-02-20 17:27:26.180291	2014-02-20 17:27:26.180291
5	Unit Conversion		2014-07-07 05:55:04.856829	2014-07-11 17:12:15.458177
7	Distributive Property		2014-07-11 17:57:58.193144	2014-07-11 17:57:58.193144
4	Distance, Rate, Time	And similar	2014-07-07 05:52:57.378728	2014-07-11 19:12:52.415076
8	Guess/Check/Estimate		2014-07-11 21:11:06.222847	2014-07-11 21:11:06.222847
9	Skills Practice		2014-07-11 21:30:05.970544	2014-07-11 21:30:05.970544
10	Solving Equations		2014-07-11 21:41:45.009242	2014-07-11 21:41:45.009242
1	Algebraic Representation	Very important all year	2014-02-14 23:00:25.509033	2014-07-12 06:00:39.601118
6	Abs Val/Num Line/Inequalities	Et al.	2014-07-11 17:57:27.350734	2014-08-01 03:27:28.025743
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('topics_id_seq', 11, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: action
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, admin, teacher, viewer) FROM stdin;
2	elindow@verizon.net	$2a$10$JVA9Tci7mX49kB7z6lnUseu/K.pK79nuY8l/DqFZylhLifcTmXF46	\N	\N	\N	10	2014-08-03 04:42:21.81988	2014-08-03 04:28:50.024204	74.101.159.88	74.101.159.88	2014-07-30 18:03:05.906702	2014-08-03 17:01:07.932585	f	f	f
1	elindow@trevor.org	$2a$10$6kKYnytON0Mu2JR/feMUUObahzdJ7s555dKcgAuX20sntxRqjW9qC	\N	\N	2014-08-03 21:29:29.520577	20	2014-08-03 21:29:29.527771	2014-08-03 17:01:19.700415	74.101.159.88	74.101.159.88	2014-07-24 19:49:15.7088	2014-08-03 21:29:29.529698	t	f	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


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
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: action; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: action; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


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

