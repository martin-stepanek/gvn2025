import { gemini15Flash, googleAI } from '@genkit-ai/googleai';
import { genkit } from 'genkit';
import { z } from 'genkit';
import {firebaseAuth} from "@genkit-ai/firebase/auth";
import { onFlow } from "@genkit-ai/firebase/functions";
import {defineSecret} from "firebase-functions/params";

const ai = genkit({
  plugins: [googleAI()],
  model: gemini15Flash, // set default model
});

const googleAIapiKey = defineSecret("GOOGLE_GENAI_API_KEY");

export const generatePoem = onFlow(
  ai,
  {
    name: "generatePoem",
    inputSchema: z.string(),
    outputSchema: z.string(),
    authPolicy: firebaseAuth((user, input) => {
      if (!user) {
        throw new Error('Authorization required.');
      }
      /* if (input.uid !== user.uid) {
        throw new Error('You may only summarize your own profile data.');
      } */
    }),
    httpsOptions: {
      secrets: [googleAIapiKey],
      cors: '*',
    },
  },
  async (subject: string) => {
    const { text } = await ai.generate(`Compose a poem about ${subject}.`);
    return text;
  }
);