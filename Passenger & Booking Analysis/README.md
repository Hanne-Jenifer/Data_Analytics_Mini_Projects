# ✈️ Hypothesis-Based Passenger & Booking Analysis

This project uses **hypothesis-driven analysis of 50,200 passenger booking records** in Microsoft
Excel to investigate booking behaviour, passenger preferences, flight characteristics, booking
completion, and passenger load patterns.

---

## 🎯 Objectives

The analysis investigates:

- Factors associated with **booking amount**
- Factors associated with **Extra Baggage** selection
- Differences in purchase behaviour by **length of stay and seat class**
- Factors associated with **booking completion**
- Passenger load patterns across **days and time segments**

---

## 📂 Dataset

The analysis is based on the **Raw Data** sheet containing **50,200 passenger records**.

### 📋 Key Variables

- `Flight number`
- `num_passengers`
- `sales_channel`
- `trip_type`
- `purchase_lead`
- `length_of_stay`
- `LOS_Segment`
- `flight_hour`
- `Day-segment`
- `flight_day`
- `Weekend`
- `route`
- `booking_origin`
- `wants_extra_baggage`
- `wants_preferred_seat`
- `wants_in_flight_meals`
- `flight_duration_planned`
- `booking_complete`
- `flight duration actual`
- `Seat class`
- `booking amount`

---

## 🔬 Hypothesis Analysis

### 🎒 Hypothesis 1 — Extra Baggage & Booking Amount

**Hypothesis:** Passengers opting for Extra Baggage have higher booking amounts.

| Extra Baggage | Average Booking Amount |
|---|---:|
| Yes | 25,606.44 |
| No | 21,411.18 |

**Finding:** Passengers selecting Extra Baggage had an average booking amount **4,195.26 higher**
than those who did not, approximately a **19.6% difference**.

---

### ✈️ Hypothesis 2 — Flight Duration & Extra Baggage

**Hypothesis:** Passengers travelling on long-duration flights (≥9 hours) are more likely to
choose Extra Baggage.

| Extra Baggage | Duration ≥9 Hours | Duration <9 Hours |
|---|---:|---:|
| Yes | 26,248.66 | 25,175.09 |
| No | 21,686.97 | 21,259.38 |

**Finding:** Booking amounts were higher for passengers travelling **9 hours or more** in both
Extra Baggage groups.

---

### 🛣️ Hypothesis 3 — Route & Flight Duration Variance

**Hypothesis:** Flight Duration Variance differs across routes.

| Route | Average Variance |
|---|---:|
| DMKKIX | 37,634 |
| DPSKIX | 0 |
| CGKKIX | 0 |
| KIXSIN | 0 |
| HKTKIX | 37,634 |
| KIXPEN | 0 |

**Finding:** **DMKKIX and HKTKIX** recorded the highest average flight-duration variance among
the routes included in the analysis, while the other listed routes recorded **0**.

---

### 💺 Hypothesis 4 — Length of Stay, Seat Class & Purchase Behaviour

Purchase behaviour was compared across **length-of-stay segments** and **seat classes**.

| Length of Stay | Business | Premium Economy | Economy |
|---|---:|---:|---:|
| Short (≤7) | 85.71 | 87.79 | 86.54 |
| Medium (8–15) | No data | No data | No data |
| Long (>15) | 83.51 | 82.82 | 83.41 |

**Finding:** Purchase behaviour shows relatively small differences across seat classes within
the available length-of-stay segments.

---

### 🪑 Hypothesis 5 — Preferred Seat & Booking Completion

**Hypothesis:** Passengers who want a Preferred Seat are more likely to complete their booking.

| Preferred Seat | Booking Completion Rate |
|---|---:|
| Yes | 17.71% |
| No | 13.79% |

**Finding:** Passengers selecting Preferred Seat had a **3.92 percentage-point higher**
booking completion rate, approximately **28.4% higher relative to passengers who did not**.

---

## 📈 Booking Behaviour

### ⏱️ Purchase Lead Time & Length of Stay

**Hypothesis:** Passengers with longer stays book earlier.

| Length of Stay | Average Purchase Lead Time |
|---|---:|
| Short Stays | 86.68 |
| Medium Stays | 90.49 |
| Long Stay | 73.01 |

**Finding:** Long-stay passengers had the **lowest average purchase lead time at 73.01**,
compared with 86.68 for short stays and 90.49 for medium stays.

---

### 💺 Purchase Lead Time by Seat Class

| Length of Stay | Business | Premium Economy | Economy |
|---|---:|---:|---:|
| Short Stays | 85.71 | 87.79 | 86.54 |
| Medium Stays | 91.56 | 89.28 | 90.66 |
| Long Stay | 72.30 | 73.54 | 73.21 |

**Finding:** Purchase lead time varies by length of stay, while differences between seat
classes within each segment are relatively small.

---

## 👥 Passenger Load Analysis

### 📅 Passenger Load by Day

| Day | Passengers |
|---|---:|
| Monday | 12,933 |
| Tuesday | 12,055 |
| Wednesday | 12,118 |
| Thursday | 11,699 |
| Friday | 10,528 |
| Saturday | 9,387 |
| Sunday | 10,842 |

**Finding:** **Monday recorded the highest passenger load at 12,933**, while Saturday recorded
the lowest at **9,387**, a difference of **3,546 passengers**.

---

### 🕐 Passenger Load by Day Segment

| Day | Night | Morning | Afternoon | Evening |
|---|---:|---:|---:|---:|
| Monday | 4,435 | 5,048 | 361 | 3,089 |
| Tuesday | 4,265 | 4,555 | 310 | 2,925 |
| Wednesday | 4,226 | 4,642 | 343 | 2,907 |
| Thursday | 4,046 | 4,542 | 294 | 2,817 |
| Friday | 3,854 | 3,928 | 297 | 2,449 |
| Saturday | 3,413 | 3,281 | 310 | 2,383 |
| Sunday | 3,472 | 3,872 | 393 | 3,105 |

**Finding:** **Monday morning recorded the highest passenger load for a single day segment
at 5,048 passengers** among the combinations shown.

---

## 🔍 Drill-Down Analysis

Additional dimensions were used to investigate the observed patterns:

### 🧑‍🤝‍🧑 Passenger & Booking Factors

- Trip Type
- Seat Class
- Booking Origin
- Sales Channel
- Passenger Count
- Extra Baggage
- Preferred Seat
- In-flight Meals

### 📅 Flight & Timing Factors

- Purchase Lead
- Flight Hour
- Flight Day
- Day Segment
- Flight Duration
- Length of Stay

These drill-downs provide additional context for understanding passenger preferences,
booking behaviour, and passenger load patterns.

---

## 🛠️ Tools & Techniques

| Tool / Technique | Purpose |
|---|---|
| **Microsoft Excel** | Data preparation and analysis |
| **Hypothesis Testing** | Evaluate proposed relationships |
| **Comparative Analysis** | Compare passenger and booking segments |
| **Pivot Tables** | Aggregate and summarize data |
| **Time-Based Analysis** | Analyze passenger loads by day and time |
| **Drill-Down Analysis** | Investigate factors behind observed patterns |

---

## 🔄 Workflow

**Hypothesis Formation → Data Preparation → Comparative Analysis → Hypothesis Evaluation →
Drill-Down Analysis → Findings**

---

## 📌 Project Outcome

The analysis identified measurable differences in **booking amounts, booking completion,
purchase lead time, flight-duration variance, and passenger loads** across the tested
passenger and flight segments.

The project demonstrates how a **hypothesis-driven approach in Excel** can move beyond
descriptive reporting to test specific questions and use data to evaluate the resulting patterns.

---

## 👤 Author

**Hanne Jenifer R**
