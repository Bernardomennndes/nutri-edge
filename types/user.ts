import { Objective } from './objective';

export type User = {
  id: number;
  name: string;
  age: number;
  height: number;
  weight: number;
  sex: 'masculine' | 'feminine';
  objective: Objective;
};
