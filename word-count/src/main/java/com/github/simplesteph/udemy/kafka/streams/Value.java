package com.github.simplesteph.udemy.kafka.streams;

public class Value {

    private String word;
    private String count;


    public String getCount() {
        return count;
    }

    public String getWord() {
        return word;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public void setWord(String word) {
        this.word = word;
    }
}
