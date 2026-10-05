package com.innioasis.ipp;

/**
 * The AB-loop icon's animation tick. Not a lambda: {@link Deck} cancels its one instance by
 * identity, and a lambda would be a new object on every post.
 */
public final class DeckAnim implements Runnable {

    @Override
    public void run() {
        Deck.animTick();
    }
}
