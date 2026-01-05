---
title: "Central Limit Theorem"
date: 2025-12-12
draft: false
---

*A silly story (and a poem) involving a wild statistical concept*

Here’s a quote that gives me pause:

> I am often asked why people tend to find probability a difficult and unintuitive idea, and I reply that, after forty years researching and teaching in this area, I have finally concluded that it is because probability really is a difficult and unintuitive idea. I have sympathy for anyone who finds probability tricky. Even after my decades as a statistician, when asked a basic school question using probability, I have to go away, sit in silence with a pen and paper, try it a few different ways, and finally announce what I **hope** is the correct answer. (bolded mine)

The author of this quote, David Spiegelhalter (see: [The Art of Statistics](https://www.amazon.com/Art-Statistics-Learning-Pelican-Books/dp/0241398630)), is referring specifically to probability theory when he says he finds probability a difficult and unintuitive idea to understand. I’ll extend his sentiment to the study of statistics as a whole, which is undergirded by probability theory, but not synonymous with it.

I struggled a lot with the most basic statistical concepts when I was a graduate student. Things like p-values, confidence intervals and the like never felt intuitive to me despite my constant use of and struggle to understand them. I knew I wasn’t the only one who didn’t quite understand statistics, but people seemed not to think this was a big deal despite the deep dependence of scientific research—of what we know (believe?)—on statistics.

I can’t explain why, but the urge to understand statistics more deeply never left me, even long after I left my PhD program. Which leads me to the [Central Limit Theorem](https://tidystat.com/central-limit-theorem-examples-plots-and-explanations/).

The CLT is one of those results that is simply baffling upon first encountering it. Dare I say it is even beautiful. I read about it again recently and still do not fully grasp it, but I will attempt to demonstrate what it is via a silly story. In a potential follow-up post, I will try to be more concrete by including explanations and code.

![Skyline from Dumbo](https://substackcdn.com/image/fetch/$s_!LASz!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa887958f-0394-4169-a971-eaff691a89a0_4032x3024.heic)

# Story time

Philberto has access to all the poems in the world. Every. Single. One. He loves knowing this fact, sometimes more than reading the poems themselves.

One day, while writing a poem of his own, he gets bored and wants to know the average number of words used per poem across every single poem in existence.

Since he has all of them, he simply has to add the number of words in each one (which may range from 37 to [100,000](https://www.readinglength.com/book/B84QNws)+, depending on how you define a poem) and divide by the total number of poems. This average is the “true” average, the ultimate truth of poetic word count, which Philberto discovers is 321 words. He goes on to name this truth “the population mean.”

Satisfied with his work, he returns to the dissatisfaction of writing poems.

***

Elsewhere, an earthling named Philika does not have access to every poem in the world. In fact, Philika has access to only a handful of collections of poems. She is a poet, after all, and poets do not make much—if any—money. She needs money, though, to support herself so she can continue writing poems. This puts her in a bind, because she does not know how to make money. She only knows how to write poems about money and not having it.

One day, while walking through the city in search of inspiration, a ghostly poster announces itself to her attention. On it is what seems to be a puzzle with a prize:

> $10000 in cash to the person who can find the true average word count of every poem ever written. ;) 
> —Anonymous

The task strikes her as impossible since she does not have access to every poem, nor will she ever. This sends her heart into a pit of depression. She walks on, regretting her life choices, cursing the universe for instilling in her a love of words.

Adding insult to injury, she is hit in the face by a loose sheet of paper on her way back home. “Just my luck,” she says.

She pulls it from her face and, strangely enough, finds a poem scratched onto it. The ink, if it is ink, is a color she hasn’t seen before. Every word seems to be engraved, which is also surprising. “Just my luck!” she says.

It’s hardly legible and the wind has found her bones, but she begins to read it anyway outside on her doorstep:

> CENTRAL LIMIT THEOREM
>  
>  
>  
>  
> If you take
> several measurements
> of quite literally anything (height, weight,
> the number of words or lines in a poem),
> calculate the average of those measurements
>  
>  
>  
>  
> and do this over and over again, you will find
> that the average of these averages
> is the same as the true average
> of what you are measuring if you had access
> to every possible observation of that thing
>  
>  
>  
>  
> (all the heights, weights, the number of words
> or lines in a poem). What I am saying is:
> The truth of a thing is revealed in the long run
>  
>  
>  
>  
> of ongoing participation. And: the extraordinary
> contributes in ordinary ways, just as equally
> as the ordinary and the less than
> when subject to random selection
>  
>  
>  
>  
> and the desire for
> randomness
> to add up
> to something.

It’s not Rilke, Gilbert, or Stevens. But something about it charms her, feels sacred even. She has no clue what it means, but the grip of inspiration is starting to take hold of her. She must follow it, no matter where it leads her; this is her life motto.

It brings her into her bedroom, where she is beckoned to count and record the number of words in every poem she has access to. When she is done she is to compute the average, a voice says. By morning she has one, but the voice tells her she has forgotten to include some poems.

“No way,” she responds, exhausted. “I know the ins and outs of every collection, every poem I have.”

But when she goes to check her bookshelf, she sees that all the poetry she owns is gone. In its place is a new set of poems and anthologies, many of which she hasn’t heard of before. One collection is authorless.

“What the f—”

Before she finishes her thought, she is seized by inspiration again. It compels her to repeat the task: *count the number of words in each new poem that has appeared, then calculate the average again.* These poems are more sparse than the ones she owned, are less wordy and more visually sprawled, making the task of counting words somewhat more annoying.

By the time she finishes, is in possession of two averages, it happens again: the poems in her home are replaced by new ones, and she is pushed to calculate more averages.

Some of them are larger than others, dramatically so. And yet, a kind of order is emerging. She is too immersed in the task to notice it, which goes on for a week until she has a thousand word count averages listed in her notebook.

She wants to drop to the floor and curl up like a ball, but one final bout of inspiration overtakes her. She cannot resist hearing its voice. The tone is gentler than before, a quiet reprieve which she feels she can inhabit. She steps into it, listens to its final message:

*Calculate the average of the averages, and then submit. Your task will be done then, I promise.*

The average of her thousand averages is **320.98 words**. She does not know where to submit, only that she must. Once it is written, she is lulled into a deep sleep, upright in her chair. She dreams of words flying above a sea of familiar numbers.

A knock on her door wakes her up. She stumbles over and opens it, finding no one there. There is merely an oversized manila envelope on the ground. She opens it cautiously—then suddenly when she realizes what’s inside. Something in the air forms into a single, incomprehensible word, a word she cannot write down but feels as if it is already known.

***

Philberto received the submission at what would have been two o’clock in the morning if he tracked his days according to human time. The rest of them had been random guesses—garbage, in other words, a lack of desire for seeking the truth. This one, on the other hand, was wildly close to the population mean. How could a mere human being achieve such a feat, he wondered? Something about the number was charged with divinity. In fact it reminded him of himself.

He smiled, formed a set of fingers to snap, granted the woman rest, and delivered her reward.

